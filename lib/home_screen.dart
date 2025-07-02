import 'package:contact/user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserCard> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29384D),
        title: Image.asset(
          'assets/images/route.png',
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: cards.isEmpty
                      ? Column(
                          children: [
                            Spacer(),
                            Center(
                              child: Image.asset(
                                'assets/images/contacts.png',
                                height: MediaQuery.sizeOf(context).height * .4,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              'There is No Contacts Added Here',
                              style: GoogleFonts.inter(
                                color: const Color(0xFFFFF1D4),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 177 / 286,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                          itemCount: cards.length,
                          itemBuilder: (context, index) => cards[index],
                        ),
                ),
                const SizedBox(height: 12),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Visibility(
                    visible: cards.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              cards.removeLast();
                            });
                          },

                          backgroundColor: const Color(0xFFF93E3E),
                          child: Image.asset('assets/images/bin.png'),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cards.length < 6,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: FloatingActionButton(
                          onPressed: () {
                            openBottomSheet(context);
                          },
                          backgroundColor: const Color(0xFFFFF1D4),
                          child: Image.asset('assets/images/plus.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addCard(UserCard card) {
    setState(() {
      cards.add(card);
    });
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true, // <-- important!
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BottomSheetBar(onAddCard: addCard),
    );
  }
}
