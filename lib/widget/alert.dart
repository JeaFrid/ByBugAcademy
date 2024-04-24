import 'package:bybugacademy/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> postPublish(BuildContext context,
    {void Function()? onFinished}) async {
  TextEditingController controller = TextEditingController();
  CosmosAlert.showCustomAlert(
    context,
    Container(
      padding: const EdgeInsets.all(14),
      width: width(context) * 0.3,
      height: width(context) * 0.3,
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
                    const ClipOval(
                      child: CosmosImage(
                        "assets/user.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "JeaFriday",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Herkese Açık",
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
                " ",
                style: GoogleFonts.poppins(
                  color: textColor.withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controller,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 14,
                ),
                cursorColor: defaultColor,
                maxLines: null,
                readOnly: false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: "Gönderi metni",
                  labelStyle: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CosmosButton.button(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                text: "Gönderiyi Yayınla",
                backgroundColor: bg,
                style: TextStyle(
                  color: defaultColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                onTap: () async {
                  if (controller.text != "") {
                    String uid = await CosmosFirebase.getUID();
                    String tag = CosmosRandom.randomTag();
                    var getIP = await Dio().get("https://api.ipify.org");
                    String ip = getIP.data;
                    await CosmosFirebase.add(
                      reference: "post",
                      tag: tag,
                      value: [
                        ip,
                        tag,
                        uid,
                        controller.text,
                        CosmosTime.getNowTimeString(),
                      ],
                      onSuccess: () {
                        Navigator.pop(context);
                        onFinished!();
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
