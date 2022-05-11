import 'package:devbook/src/constant/color.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    bool obsureText = isPassword;
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          obscureText: obsureText,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obsureText = !obsureText;
                      });
                    },
                    icon: obsureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),

            filled: true,
            fillColor: ColorPlatte.secondaryColor,
            // labelText: labelText,
            hintText: hintText,

            hintStyle: const TextStyle(
                color: Colors.white,
                // fontFamily: 'CircularStd-Book',
                fontWeight: FontWeight.w300),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
      );
    });
  }
}
