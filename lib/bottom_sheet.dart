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
  final nameController = TextEditingController();
  final nameDisplayController = TextEditingController();

  final emailController = TextEditingController();
  final emailDisplayController = TextEditingController();

  final phoneController = TextEditingController();
  final phoneDisplayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.5,
        color: const Color(0xFF29384D),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 5, child: Column(children: [PickImg()])),
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
            Spacer(),
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
            Spacer(),

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
            Spacer(),

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
            Spacer(),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .06,
              child: ElevatedButton(
                onPressed: () {
                  final newCard = UserCard(
                    name: 'test',
                    email: 'test',
                    phone: 'test',
                  );
                  widget.onAddCard(newCard);
                  Navigator.pop(context);
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
    );
  }
}
