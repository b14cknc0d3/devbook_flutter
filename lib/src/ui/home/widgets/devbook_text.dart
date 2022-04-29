import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevBookText extends StatelessWidget {
  const DevBookText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Dev',
        style: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color(0xff0abde3),
        ),
        children: [
          TextSpan(
            text: 'book',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2e86de),
            ),
          ),
        ],
      ),
    );
  }
}
