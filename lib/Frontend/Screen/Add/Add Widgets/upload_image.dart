import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        borderType: BorderType.Circle,
        color: Colors.blue,
        child: CircleAvatar(
          radius: 51,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.upload,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () {
              print("Upload button pressed");
            },
          ),
        ),
      ),
    );
  }
}


