import 'package:fidisys_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key key,
    @required this.buildContext,
    @required this.controller,
    this.hintText,
    @required this.width,
    @required this.keyboardInputType,
    this.isPassword,
    this.multiline,
  }) : super(key: key);

  final BuildContext buildContext;
  final TextEditingController controller;
  final String hintText;
  final double width;
  final TextInputType keyboardInputType;
  final bool isPassword;
  final int multiline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      child: Material(
        elevation: 5.0,
        borderRadius: kBorderRadius,
        child: TextFormField(
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
          keyboardType: keyboardInputType,
          maxLines: multiline == null ? 1 : null,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: controller,
          obscureText: isPassword == null ? false : isPassword,
          autofocus: false,
          decoration: InputDecoration(
            focusedBorder: kTextFieldBorder,
            border: kTextFieldBorder,
            enabledBorder: kTextFieldBorder,
            disabledBorder: kTextFieldBorder,
            hintText: hintText == null ? '' : hintText,
            isCollapsed: true,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white,
            ),
            fillColor: Color(0xFF292333),
            filled: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.02),
          ),
        ),
      ),
    );
  }
}
