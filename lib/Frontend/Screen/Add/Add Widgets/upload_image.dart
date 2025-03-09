import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: DottedBorder(
          borderType: BorderType.Circle,
          color: Colors.blue,
          strokeWidth: 2,
          dashPattern: [6, 3],
          child: CircleAvatar(
            radius: 51,
            backgroundColor: Colors.white,
            backgroundImage: _selectedImage != null
                ? FileImage(File(_selectedImage!.path)) // Display selected image
                : null,
            child: _selectedImage == null
                ? Icon(
              Icons.upload,
              color: Colors.blue,
              size: 30,
            )
                : null, // Hide icon if image is selected
          ),
        ),
      ),
    );
  }
}
