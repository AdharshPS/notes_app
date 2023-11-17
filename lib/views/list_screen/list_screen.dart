import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/data_base.dart';
import 'package:flutter_application_2/model/notes_model.dart';
import 'package:flutter_application_2/views/list_screen/widgets/list_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();

  String value = "";

  int? checkValue;

  Color? containerColor;

  List<Color> colorList = [
    Colors.green,
  ];

  List<NotesModel> addList = [
    NotesModel(
      title: "modelTitle",
      description: "modelDescription",
      date: "modelDate",
      color: 4,
    ),
    // NotesModel(
    //   title: "modelTitle2",
    //   description: "modelDescription2",
    //   date: "modelDate2",
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: addList.length,
          itemBuilder: (context, index) => ListScreenWidget(
            color: DataBase.colorList[addList[index].color],
            title: addList[index].title,
            description: addList[index].description,
            date: addList[index].date,
            onDeleteTap: () {
              addList.removeAt(index);
              setState(() {});
            },
            onEdit: () {
              value = "Update";
              bottomSheet(context);
              nameController.text = addList[index].title;
              desController.text = addList[index].description;
              dateController.text = addList[index].date;
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            value = "Submit";
            checkValue = null;
            bottomSheet(context);
          }),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, inSetState) => Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: (context, index) => Container(
              //       width: 300,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: TextField(
              //         decoration: InputDecoration(
              //           contentPadding: EdgeInsets.symmetric(
              //               vertical: 10, horizontal: 20),
              //           filled: true,
              //           fillColor: Colors.grey,
              //           hintStyle: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w900,
              //           ),
              //           hintText: bottomSheetContents[index],
              //         ),
              //       ),
              //     ),
              //     separatorBuilder: (context, index) => SizedBox(height: 10),
              //     itemCount: 3,
              //   ),
              // ),
              SizedBox(height: 10),
              Container(
                width: 300,
                height: 40,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                      hintText: "Title"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: desController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                      hintText: "Description"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                      hintText: "Date"),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  DataBase.colorList.length,
                  (index) => InkWell(
                    onTap: () {
                      checkValue = index;
                      inSetState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: DataBase.colorList[index].withOpacity(.5),
                        shape: BoxShape.circle,
                        border: checkValue == index
                            ? Border.all(
                                color: DataBase.colorList[index],
                                width: 5,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  addList.add(
                    NotesModel(
                      title: nameController.text,
                      description: desController.text,
                      date: dateController.text,
                      color: checkValue!,
                    ),
                  );
                  setState(() {});
                  nameController.clear();
                  desController.clear();
                  dateController.clear();
                  Navigator.pop(context);
                },
                child: Text(value),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
