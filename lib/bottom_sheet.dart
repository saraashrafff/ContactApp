import 'package:contact/pickimg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetBar extends StatefulWidget {
  const BottomSheetBar({super.key});

  @override
  State<BottomSheetBar> createState() => _BottomSheetBarState();
}

class _BottomSheetBarState extends State<BottomSheetBar> {
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
                      Text(
                        'Name',
                        style: GoogleFonts.inter(
                          color: Color(0xFFFFF1D4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(color: Color(0xFFFFF1D4)),
                      Text(
                        'Email',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFFFF1D4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(color: Color(0xFFFFF1D4)),
                      Text(
                        'Number',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFFFF1D4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            TextFormField(
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
                onPressed: () {},
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
