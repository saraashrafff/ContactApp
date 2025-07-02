import 'dart:io';

import 'package:contact/pickimg.dart';
import 'package:contact/user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetBar extends StatefulWidget {
  final Function(UserCard) onAddCard;
  const BottomSheetBar({super.key, required this.onAddCard});
  @override
  State<BottomSheetBar> createState() => _BottomSheetBarState();
}

class _BottomSheetBarState extends State<BottomSheetBar> {
  File? selectedImage;

  final nameController = TextEditingController();
  final nameDisplayController = TextEditingController();

  final emailController = TextEditingController();
  final emailDisplayController = TextEditingController();

  final phoneController = TextEditingController();
  final phoneDisplayController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            color: const Color(0xFF29384D),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            PickImg(
                              onImagePicked: (pickedImageFile) {
                                setState(() {
                                  selectedImage = pickedImageFile;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: Color(0xFFFFF1D4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: nameDisplayController,
                              readOnly: true,

                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: GoogleFonts.inter(
                                  color: Color(0xFFFFF1D4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: Color(0xFFFFF1D4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: emailDisplayController,
                              readOnly: true,

                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: GoogleFonts.inter(
                                  color: Color(0xFFFFF1D4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: Color(0xFFFFF1D4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: phoneDisplayController,
                              readOnly: true,

                              decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: GoogleFonts.inter(
                                  color: Color(0xFFFFF1D4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFF1D4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: nameController,
                    onChanged: (value) {
                      nameDisplayController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a Name';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter User Name',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xFFE2F4F6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFF1D4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: emailController,
                    onChanged: (value) {
                      emailDisplayController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an Email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter User Email',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xFFE2F4F6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFF1D4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: phoneController,
                    onChanged: (value) {
                      phoneDisplayController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a Phone Number';
                      }
                      final phoneRegex = RegExp(
                        r'^\+?\d{7,15}$',
                      ); // Supports optional + and digits only
                      if (!phoneRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter User Phone',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xFFE2F4F6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * .06,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final newCard = UserCard(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            image: selectedImage,
                          );

                          widget.onAddCard(newCard);
                          Navigator.pop(context);
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFF1D4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Enter User',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF29384D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
