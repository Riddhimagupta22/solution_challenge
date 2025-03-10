import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solution_chanllenge/Frontend/Auth/login_screen.dart';
import 'package:solution_chanllenge/Frontend/Features/Onboarding%20Screen/content_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Image.asset(contents[i].image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 8),
                        child: Text(
                          contents[i].title,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 8),
                        child: Text(
                          contents[i].discription,
                          style: GoogleFonts.poppins(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: contents.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.blue,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.all(40),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            currentIndex == contents.length - 1 ? "Continue" : "Next",
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (currentIndex == contents.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  LoginScreen(),
                                ),
                              );
                            } else {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
