import 'package:bybugacademy/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatelessWidget {
  final double? fontSize;
  final String text;

  const LinkText({
    super.key,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        CosmosAlert.showMessage(
          context,
          "Kopyalamak ister misiniz?",
          "Metni kopyalamak istiyorsanız metin üzerine çift tıklayın.",
          color: textColor,
          backgroundColor: bg,
        );
      },
      onDoubleTap: () async {
        await copy(text).then((value) {
          CosmosAlert.showToast(context,
              child: const Center(child: Text("Metin kopyalandı.")));
        });
      },
      child: RichText(
        text: TextSpan(
          children: _parseText(text),
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.6),
            fontSize: fontSize ?? 12,
          ),
        ),
      ),
    );
  }

  List<TextSpan> _parseText(String text) {
    List<TextSpan> spans = [];
    RegExp linkRegex = RegExp(r"(?:https?|ftp):\/\/[\w/\-?=%.]+\.[\w/\-?=%.]+",
        caseSensitive: false);

    text.splitMapJoin(linkRegex, onMatch: (match) {
      String link = match.group(0)!;
      spans.add(TextSpan(
        text: link,
        style: GoogleFonts.poppins(
          color: Colors.blue,
          fontSize: fontSize ?? 12,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            await openUrl(link);
          },
      ));
      return '';
    }, onNonMatch: (nonMatch) {
      spans.add(TextSpan(text: nonMatch));
      return '';
    });

    return spans;
  }
}
