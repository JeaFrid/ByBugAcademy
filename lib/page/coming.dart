import 'dart:async';

import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatefulWidget {
  final IconData icon;
  final String title;

  const ComingSoon({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  bool liveBool = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (liveBool == true) {
          setState(() {
            liveBool = false;
          });
        } else {
          setState(() {
            liveBool = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: defaultColor,
                    size: 50,
                  ),
                  SizedBox(
                    width: width(context) * 0.8,
                    child: Center(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          color: defaultColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: width(context) * 0.8,
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Bu özellik, akademiye henüz gelmedi. Bu sayfa ve diğer henüz gelmemiş sayfalar ",
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "anlık güncellenebilir. Bu nedenle sık sık bu sayfaları kontrol edin.",
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CosmosButton.button(
                    text: "Geri Dön",
                    backgroundColor: navColor,
                    color: defaultColor,
                    style: GoogleFonts.poppins(
                      color: defaultColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 190, 43, 33),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                          child: Center(
                            child: Visibility(
                              visible: liveBool,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Canlı",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
