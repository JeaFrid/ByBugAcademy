import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/utils/textfield.dart';
import 'package:opensource/web/sertifika.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSertifikaWeb extends StatefulWidget {
  const AddSertifikaWeb({super.key});

  @override
  State<AddSertifikaWeb> createState() => _AddSertifikaWebState();
}

class _AddSertifikaWebState extends State<AddSertifikaWeb> {
  TextEditingController ogrenciSertifikaNo = SyntaxTextEditingController();
  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.code,
      title: "Yeni Sertifika Oluştur",
      children: [
        Text(
          "Sertifika Bilgileri",
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
            controller: ogrenciSertifikaNo,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: 1,
            readOnly: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Öğrenci Kimlik Numarası",
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
          text: "Sertifika Yayınla",
          backgroundColor: bg,
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          onTap: () async {
            if (ogrenciSertifikaNo.text != "") {
              String tag = CosmosRandom.randomTag();
              String uid = await CosmosFirebase.getUID();
              await CosmosFirebase.add(
                reference: "certificate",
                tag: tag,
                value: [
                  uid,
                  tag,
                  ogrenciSertifikaNo.text,
                  CosmosTime.getNowTimeString(),
                ],
                onSuccess: () {
                  CosmosNavigator.pushDownFromTopReplacement(
                    context,
                    const SertifikaWeb(),
                  );
                },
                onError: () {
                  CosmosAlert.showMessage(
                    context,
                    "Opps...",
                    "Hata oluştu.",
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
                "Proje bilgilerini tam olarak doldurun.",
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
