import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImg extends StatefulWidget {
  final Function(File) onImagePicked;

  const PickImg({super.key, required this.onImagePicked});

  @override
  State<PickImg> createState() => _PickImgState();
}

class _PickImgState extends State<PickImg> {
  File? image;

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) {
        print('No image selected.');
        return;
      }

      final pickedImageFile = File(pickedFile.path);

      setState(() {
        image = pickedImageFile;
      });

      // Notify BottomSheetBar about the picked image
      widget.onImagePicked(pickedImageFile);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFF1D4)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: GestureDetector(
        onTap: pickImage,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: image != null
              ? Image.file(image!, fit: BoxFit.cover)
              : Image.asset('assets/images/imgs.png'),
        ),
      ),
    );
  }
}
