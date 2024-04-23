import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/App/Screens/Nav_Screen.dart';
import 'package:restaurant_app/App/Widgets/custom_field.dart';
import 'package:restaurant_app/App/Widgets/hex_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double screenWidth = constraints.maxWidth;
      final double screenHeight = constraints.maxHeight;
      return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  PasswordTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isObscurable: true,
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          HexColor('FFA23D'),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                                color: HexColor('A55804'), width: 2.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 18, horizontal: 100),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(NavScreen.routeName);
                      },
                      //_showOtpDialog(emailController.text);

                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        color: Colors.black45,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
