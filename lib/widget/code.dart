import 'package:bybugacademy/theme/color.dart';
import 'package:bybugacademy/utils/textfield.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeComponent extends StatefulWidget {
  final String title;
  final String subtitle;
  final String language;
  final String code;
  const CodeComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.code,
    required this.language,
  });

  @override
  State<CodeComponent> createState() => _CodeComponentState();
}

class _CodeComponentState extends State<CodeComponent> {
  TextEditingController textEditingController = SyntaxTextEditingController();
  bool isMobile(BuildContext context) {
    if (width(context) < 1500) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.code;
    return mobile(
        context); //isMobile(context) == true ? mobile(context) : pc(context);
  }

  Container pc(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    color: defaultColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.language,
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SelectableText(
                  widget.subtitle,
                  maxLines: 6,
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: CosmosButton.borderButton(
                        text: "Kodu Kopyala",
                        borderColor: defaultColor,
                        color: textColor,
                        onTap: () async {
                          await copy(widget.code).then((value) {
                            CosmosAlert.showToast(
                              context,
                              child: const Center(
                                child: Text(
                                  "Kaynak kod panoya kopyalandı.",
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Opacity(
                      opacity: 0.7,
                      child: CosmosButton.borderButton(
                        text: "Hata Bildir",
                        borderColor: defaultColor,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(width: 100),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 600,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: textColor.withOpacity(0.7),
              ),
            ),
            child: TextField(
              controller: textEditingController,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: null,
              readOnly: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "",
                hintStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Container mobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: textColor.withOpacity(0.7),
              ),
            ),
            child: TextField(
              controller: textEditingController,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: null,
              readOnly: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "",
                hintStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              color: defaultColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.language,
            style: GoogleFonts.poppins(
              color: textColor.withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SelectableText(
            widget.subtitle,
            maxLines: 6,
            style: GoogleFonts.poppins(
              color: textColor.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Opacity(
                opacity: 0.7,
                child: CosmosButton.borderButton(
                  text: "Kodu Kopyala",
                  borderColor: defaultColor,
                  color: textColor,
                  onTap: () async {
                    await copy(widget.code).then((value) {
                      CosmosAlert.showToast(
                        context,
                        child: const Center(
                          child: Text(
                            "Kaynak kod panoya kopyalandı.",
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: CosmosButton.borderButton(
                  text: "Hata Bildir",
                  borderColor: defaultColor,
                  color: textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
