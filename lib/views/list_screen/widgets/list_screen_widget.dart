import 'package:flutter/material.dart';

class ListScreenWidget extends StatefulWidget {
  ListScreenWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.onDeleteTap,
    this.onEdit,
    required this.color,
  });
  String title;
  String description;
  String date;
  // void Function()? onTap   or
  void Function()? onDeleteTap;
  void Function()? onEdit;

  Color color;

  @override
  State<ListScreenWidget> createState() => _ListScreenWidgetState();
}

class _ListScreenWidgetState extends State<ListScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.date,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: widget.onEdit,
                child: Icon(Icons.edit),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: widget.onDeleteTap,
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
