import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution_chanllenge/Frontend/Role%20Choosing/role_chossing.dart';
import '../../Backend/Service/Auth Service/auth_service.dart';
import '../Features/Widgets/custom_widgets.dart';
import 'login_screen.dart';


class SignUpScreen extends StatelessWidget {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // textfield

            Padding(
              padding:  EdgeInsets.only(left: scrWidth * 0.1,right: scrWidth * 0.1,top: scrHeight * 0.3,),
              child: Form(key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWidgets.CustomTextfield(text: 'Username', icon: Icons.perm_identity_sharp,controller: null, label: 'Enter Name'),
                    SizedBox(height: scrHeight * 0.01,),
                    CustomWidgets.CustomTextfield(text: 'Email', icon: Icons.email, controller:emailController, label: 'Enter Email',),
                    SizedBox(height: scrHeight * 0.01,),
                    CustomWidgets.CustomTextfield(text: 'Password', icon: Icons.lock_outline, controller:passwordController,label: 'Enter valid password'),
                    SizedBox(height: scrHeight * 0.01,),
                    CustomWidgets.CustomTextfield(text: 'Confirm Password', icon: Icons.lock_outline,controller: null, label: 'Enter Same password'),
                    SizedBox(height: scrHeight * 0.01),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text("I agree to the Terms & Conditions"),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthService()
                              .AccountwithEmail(
                              emailController.text,
                              passwordController.text)
                              .then((value) {
                            if (value == 'Account Created') {
                              Get.snackbar('', 'Account Created');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RoleChoosing()));
                            } else {
                              Get.snackbar("Error", value);
                            }
                          });
                        }// Corrected navigation
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize:  Size(scrWidth*.5,scrHeight*.045),
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.black
                      ),
                      child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: scrHeight * 0.01),
                    Text('or',textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Color(0xFF666666),
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.01),
                    OutlinedButton(
                      onPressed: () { AuthService()
                          .signUpwithGoogle()
                          .then((user) {
                        if (user != null) {
                          Get.snackbar("",
                              'Signed in as ${user.displayName}');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoleChoosing()));
                        } else {
                          // Get.snackbar('Error', 'Sign In failed');
                        }
                      });
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, scrHeight*.045),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3,bottom: 3),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage("Assets/images/googlelogo.jpg"),
                            ),
                          ),
                          Text("Continue with Google",style: GoogleFonts.poppins(
                              letterSpacing: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          ),
                        ],
                      ),),
                    SizedBox(height:  scrHeight * 0.13),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child:  RichText(text:
                      TextSpan(
                        text: 'Already have an account?',
                        style: GoogleFonts.inter(
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text: 'LogIn',
                            style: GoogleFonts.inter(
                                letterSpacing: 0,

                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFB300)
                            ),)
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