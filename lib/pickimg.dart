import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImg extends StatefulWidget {
  const PickImg({super.key});

  @override
  State<PickImg> createState() => _PickImgState();
}

class _PickImgState extends State<PickImg> {
  File? image;
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
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
              : Image.asset('assets/images/imgs.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
