import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:solution_chanllenge/Frontend/Auth/signup_screen.dart';
import 'package:solution_chanllenge/Frontend/Role%20Choosing/role_chossing.dart';

import '../../Backend/Service/Auth Service/auth_service.dart';
import '../Features/Widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [

            // Positioned(
            //   top: scrHeight * 0.128,
            //   right: scrWidth * 0.43,
            //   width: scrWidth * 0.7,
            //   height: scrHeight * 0.08,
            //   child: Text(
            //     'Login',
            //     textAlign: TextAlign.center,
            //     style: GoogleFonts.inter(
            //       letterSpacing: 1,
            //       fontSize: 30,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: scrHeight * 0.183,
            //   right: scrWidth * 0.49,
            //   width: scrWidth * 0.7,
            //   height: scrHeight * 0.08,
            //   child: Text(
            //     'And',
            //     textAlign: TextAlign.center,
            //     style: GoogleFonts.inter(
            //         letterSpacing: 1,
            //         fontSize: 24,
            //         fontWeight: FontWeight.w700,
            //         color: Color(0xFFFFB300)),
            //   ),
            // ),
            // Positioned(
            //     top: scrHeight * 0.176,
            //     right: scrWidth * 0.08,
            //     width: scrWidth * 0.7,
            //     height: scrHeight * 0.08,
            //     child: Hero(
            //       tag: 'takeit',
            //       child: Text(
            //         'TakeIt',
            //         style: GoogleFonts.inter(
            //             letterSpacing: 0,
            //             fontStyle: FontStyle.italic,
            //             fontSize: 36,
            //             fontWeight: FontWeight.w800,
            //             color: Color(0xFF0071DC)),
            //       ),
            //     )),
            Padding(
              padding: EdgeInsets.only(
                left: scrWidth * 0.1,
                right: scrWidth * 0.1,
                top: scrHeight * 0.4,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWidgets.CustomTextfield(
                      text: 'Email',
                      icon: Icons.email,
                      controller: emailController,
                      label: 'Enter Email',
                    ),
                    SizedBox(
                      height: scrHeight * 0.01,
                    ),
                    CustomWidgets.CustomTextfield(
                        text: 'Password',
                        icon: Icons.lock_outline,
                        controller: passwordController,
                        label: 'Enter valid password'),
                    SizedBox(height: scrHeight * 0.04),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthService()
                              .LogInwithEmail(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RoleChoosing()));
                            } else {
                              Get.snackbar("Error", value);
                            }
                          });
                        } // Corrected navigation
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(scrWidth * .5, scrHeight * .045),
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.black),
                      child: Text("Log In",
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    SizedBox(height: scrHeight * 0.02),
                    Text(
                      'or',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Color(0xFF666666),
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.02),
                    OutlinedButton(
                      onPressed: () {
                        AuthService().signUpwithGoogle().then((user) {
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoleChoosing()));
                          } else {
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, scrHeight * .045),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3,bottom: 3),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage("Assets/images/googlelogo.jpg"),
                            ),
                          ),
                          Text(
                            "Continue with Google",
                            style: GoogleFonts.poppins(
                                letterSpacing: 1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.18),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: RichText(
                          text: TextSpan(
                        text: 'Don’t have an account?',
                        style: GoogleFonts.inter(
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.inter(
                                letterSpacing: 0,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFB300)),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
