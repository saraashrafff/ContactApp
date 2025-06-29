import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  String name;
  String email;
  String phone;
  UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
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
          bottom: 90,
          right: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              'assets/images/cat2.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
