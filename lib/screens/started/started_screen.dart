import 'package:flutter/material.dart';
import 'package:free_courses_app/const/const.dart';
import 'package:free_courses_app/screens/login/screen/login_screen.dart';
import 'package:free_courses_app/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/started_screen.png',
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.95,
              fit: BoxFit.contain,
            ),
            Text(
              'Explore top courses',
              style:
                  GoogleFonts.acme(fontSize: 38, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Explore courses designed to help you develop your skills and aid your knowledge ',
              textAlign: TextAlign.center,
              style: GoogleFonts.adamina(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressed: () => navigateTo(context, const LoginScreen()),
              title: 'Get Started',
            )
          ],
        ),
      ),
    );
  }
}
