import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:raya_institute_chat_app/Core/Constants/colors.dart';
import 'package:raya_institute_chat_app/Views/Home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _showCards();
  }

  Future<void> _showCards() async {
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 4; i++) {
      if (mounted) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _currentIndex = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: h * .05,
            ),
            Text(
              textAlign: TextAlign.center,
              'Welcome to RAYA Chat',
              style: GoogleFonts.aBeeZee(
                  color: kveryWhite,
                  fontSize: w * .07,
                  fontWeight: FontWeight.bold),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                AnimatedOpacity(
                  opacity: _currentIndex >= 0 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading:
                          const Icon(Icons.chat, size: 50, color: kSecondary),
                      title: Text(
                        'What is this app?',
                        style: GoogleFonts.aBeeZee(
                            color: kPrimary,
                            fontSize: w * .05,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'This app allows you to chat with AI and ask questions about any document you upload.',
                        style: GoogleFonts.aBeeZee(
                            color: kDGrey,
                            fontSize: w * .038,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _currentIndex >= 1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.file_copy,
                          size: 50, color: kPrimary),
                      title: Text(
                        'Upload Files',
                        style: GoogleFonts.aBeeZee(
                            color: kPrimary,
                            fontSize: w * .05,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'You can upload a text or PDF file, and ask questions related to its content.',
                        style: GoogleFonts.aBeeZee(
                            color: kDGrey,
                            fontSize: w * .038,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _currentIndex >= 2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.accessibility,
                          size: 50, color: kSecondary),
                      title: Text(
                        'AI Powered Responses',
                        style: GoogleFonts.aBeeZee(
                            color: kPrimary,
                            fontSize: w * .05,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Get AI-generated answers based on the contents of the file you upload.',
                        style: GoogleFonts.aBeeZee(
                            color: kDGrey,
                            fontSize: w * .038,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _currentIndex >= 3 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.navigate_next,
                          size: 50, color: kPrimary),
                      title: Text(
                        'Start Chatting',
                        style: GoogleFonts.aBeeZee(
                            color: kPrimary,
                            fontSize: w * .05,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Once you\'re ready, click the button below to start chatting with AI.',
                        style: GoogleFonts.aBeeZee(
                            color: kDGrey,
                            fontSize: w * .038,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_currentIndex == 3)
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45, top: 28),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    height: h * .06,
                    width: w * .5,
                    decoration: BoxDecoration(
                      color: kveryWhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Start Chat',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                          fontSize: w * .07,
                          fontWeight: FontWeight.bold,
                          color: kSecondary,
                        ),
                      ),
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
