  import 'package:bybugacademy/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myButton(String name, {void Function()? onTap, bool? noPadding}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: noPadding == true ? 2 : 8, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            border: Border.all(
              width: 2,
              color: Colors.transparent,
            ),
          ),
          child: Text(
            name,
            style: GoogleFonts.poppins(
              color: textColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
