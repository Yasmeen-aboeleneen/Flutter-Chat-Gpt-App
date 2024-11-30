import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raya_institute_chat_app/Core/Constants/colors.dart';
import 'package:raya_institute_chat_app/Views/Home/onboarding_screen.dart';
import 'package:raya_institute_chat_app/Widgets/custom_buttons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late List<bool> _isVisible;
  late AnimationController _rotationController;
  bool _showImage = false;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _isVisible = [false, false, false, false];
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _startAnimation();
  }

  void _startAnimation() {
    // ظهور النصوص واحدًا تلو الآخر
    for (int i = 0; i < _isVisible.length; i++) {
      Timer(Duration(milliseconds: i * 500), () {
        if (mounted) {
          setState(() {
            _isVisible[i] = true;
          });
        }
      });
    }

    // تأخير عرض الصورة بعد اكتمال النصوص
    Timer(Duration(milliseconds: _isVisible.length * 500), () {
      if (mounted) {
        setState(() {
          _showImage = true;
        });
        _rotationController.repeat(); // بدء دوران الصورة

        // تأخير عرض الزر بعد انتهاء دوران الصورة
        Timer(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _showButton = true;
            });
            _rotationController.stop(); // إيقاف الدوران إذا لزم الأمر
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedLetter("R", kSecondary, _isVisible[0], w),
                _buildAnimatedLetter("A", kveryWhite, _isVisible[1], w),
                _buildAnimatedLetter("Y", kSecondary, _isVisible[2], w),
                _buildAnimatedLetter("A", kveryWhite, _isVisible[3], w),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (_showImage)
            RotationTransition(
              turns: _rotationController,
              child: Image.asset(
                'Assets/Images/img1.png',
                color: kveryWhite,
                height: h * .3,
              ),
            ),
        ],
      ),
      floatingActionButton: _showButton
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen()));
              },
              child: const CustomButtons(
                text: 'Start',
              ))
          : null,
    );
  }

  Widget _buildAnimatedLetter(
      String letter, Color color, bool isVisible, double width) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Text(
        letter,
        style: GoogleFonts.lora(
          color: color,
          fontSize: width * 0.3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
