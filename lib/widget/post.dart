import 'package:bybugacademy/widget/linktext.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class PostComponent extends StatefulWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? time;
  final String? text;
  const PostComponent({
    super.key,
    this.image,
    this.title,
    this.subtitle,
    this.time,
    this.text,
  });

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  bool isMobile(BuildContext context) {
    if (width(context) < 1500) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isMobile(context) == true ? mobile(context) : pc(context);
  }

  Container pc(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(2),
      width: width(context) * 0.3,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipOval(
                      child: CosmosImage(
                        widget.image ?? "assets/user.png",
                        width: 50,
                        height: 50,
                        errorImage: const AssetImage("assets/user.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? "Kullanıcı Adı",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.subtitle ?? "Herkese Açık",
                          style: GoogleFonts.poppins(
                            color: textColor.withOpacity(0.7),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.time ?? "XX:XX",
                style: GoogleFonts.poppins(
                  color: textColor.withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LinkText(
              text: widget.text ??
                  "Deserunt reprehenderit ullamco enim culpa id eu. Quis dolore labore adipisicing incididunt sit cupidatat ad enim nulla sint dolor laboris. Occaecat magna occaecat deserunt occaecat officia. Lorem dolore sunt quis magna ex. Consequat eiusmod eiusmod enim laborum nostrud veniam sunt et amet eiusmod pariatur veniam mollit.",
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Container mobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      width: width(context),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipOval(
                      child: CosmosImage(
                        widget.image ?? "assets/user.png",
                        width: 40,
                        height: 40,
                        errorImage: const AssetImage("assets/user.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? "Kullanıcı Adı",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.subtitle ?? "Herkese Açık",
                          style: GoogleFonts.poppins(
                            color: textColor.withOpacity(0.7),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.time ?? "XX:XX",
                style: GoogleFonts.poppins(
                  color: textColor.withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LinkText(
              text: widget.text ??
                  "Deserunt reprehenderit ullamco enim culpa id eu. Quis dolore labore adipisicing incididunt sit cupidatat ad enim nulla sint dolor laboris. Occaecat magna occaecat deserunt occaecat officia. Lorem dolore sunt quis magna ex. Consequat eiusmod eiusmod enim laborum nostrud veniam sunt et amet eiusmod pariatur veniam mollit.",
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
