import 'dart:io';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  String name;
  String email;
  String phone;
  final File? image;
  // final voidCallBack onDelete;

  UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(decoration: BoxDecoration(color: Color(0xFFFFF1D4))),
        ),

        Positioned(
          top: 0,
          bottom: 120,
          right: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: image != null
                ? Image.file(
                    image!,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.person, size: 40),
          ),
        ),
        Positioned(
          bottom: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [Text(email), SizedBox(height: 12), Text(phone)],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .05,
                  color: Color(0xFFF93E3E),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/bin.png',
                          height: 10,
                          width: 12.5,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
