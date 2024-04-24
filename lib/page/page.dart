import 'package:opensource/page/schema.dart';
import 'package:opensource/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  const NewPage({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Schema(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: textColor.withOpacity(0.5),
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: children,
          ),
        ],
      ),
    );
  }
}
