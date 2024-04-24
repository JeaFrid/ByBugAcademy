import 'package:opensource/page/page.dart';
import 'package:opensource/page/sertifika.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBasarimMobile extends StatefulWidget {
  const AddBasarimMobile({super.key});

  @override
  State<AddBasarimMobile> createState() => _AddBasarimMobileState();
}

class _AddBasarimMobileState extends State<AddBasarimMobile> {
  TextEditingController baslik = TextEditingController();
  TextEditingController aciklama = TextEditingController();
  TextEditingController userID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.code,
      title: "Yeni Başarım Oluştur",
      children: [
        Text(
          "Başarım Bilgileri",
          style: GoogleFonts.poppins(
            color: defaultColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 600,
          child: TextField(
            controller: baslik,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: null,
            readOnly: false,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Başlık",
              labelStyle: GoogleFonts.ubuntu(
                color: textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 600,
          child: TextField(
            controller: aciklama,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: null,
            readOnly: false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Açıklama",
              labelStyle: GoogleFonts.ubuntu(
                color: textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 600,
          child: TextField(
            controller: userID,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: null,
            readOnly: false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Öğrenci Numarası",
              labelStyle: GoogleFonts.ubuntu(
                color: textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        CosmosButton.button(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          text: "Başarım Yayınla",
          backgroundColor: bg,
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          onTap: () async {
            if (baslik.text != "" && aciklama.text != "" && userID.text != "") {
              String tag = CosmosRandom.randomTag();
              String uid = await CosmosFirebase.getUID();
              await CosmosFirebase.add(
                reference: "basarim",
                tag: tag,
                value: [
                  uid,
                  tag,
                  baslik.text,
                  aciklama.text,
                  userID.text,
                  CosmosTime.getNowTimeString(),
                ],
                onSuccess: () {
                  CosmosNavigator.pushDownFromTopReplacement(
                    context,
                    const Sertifika(),
                  );
                },
                onError: () {
                  CosmosAlert.showMessage(
                    context,
                    "Opps...",
                    "Bir hata oluştu.",
                    color: textColor,
                    backgroundColor: cColor,
                    button: "Tamam",
                  );
                },
              );
            } else {
              CosmosAlert.showMessage(
                context,
                "Opps...",
                "Başarım bilgilerini tam olarak doldurun.",
                color: textColor,
                backgroundColor: cColor,
                button: "Tamam",
              );
            }
          },
        ),
      ],
    );
  }
}
