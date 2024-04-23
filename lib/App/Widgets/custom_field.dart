import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Color iconColor;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: iconColor, // Set the icon color
              )
            : null,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscurable;
  final IconData? prefixIcon;
  final Color iconColor;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isObscurable = false,
    this.prefixIcon,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isObscurable ? isObscure : false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isObscurable
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: widget.iconColor, // Set the icon color
              )
            : null,
      ),
    );
  }
}
