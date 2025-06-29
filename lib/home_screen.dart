import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/route.png',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/contacts.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'There is No Contacts Added Here',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFFFF1D4),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      openBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF1D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Image.asset('assets/images/plus.png'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const BottomSheetBar(),
    );
  }
}
