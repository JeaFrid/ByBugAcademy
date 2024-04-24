import 'package:opensource/page/page.dart';
import 'package:opensource/page/sourcecode.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/utils/textfield.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSCodeMobile extends StatefulWidget {
  const AddSCodeMobile({super.key});

  @override
  State<AddSCodeMobile> createState() => _AddSCodeMobileState();
}

class _AddSCodeMobileState extends State<AddSCodeMobile> {
  TextEditingController projectName = SyntaxTextEditingController();
  TextEditingController projectAbout = SyntaxTextEditingController();
  TextEditingController projectLanguage = SyntaxTextEditingController();
  TextEditingController projectCode = SyntaxTextEditingController();
  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.code,
      title: "Yeni Kaynak Kod Paylaş",
      children: [
        Text(
          "Proje Bilgileri",
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
            controller: projectName,
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
              labelText: "Proje Adı",
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
            controller: projectAbout,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: null,
            readOnly: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Proje Açıklaması",
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
            controller: projectLanguage,
            style: GoogleFonts.ubuntu(
              color: textColor,
              fontSize: 14,
            ),
            cursorColor: defaultColor,
            maxLines: null,
            readOnly: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Programlama Dili",
              labelStyle: GoogleFonts.ubuntu(
                color: textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "İlgili Kod Parçacığı",
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
          width: 600,
          height: 300,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: projectCode,
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
              hintText: "Kod parçacığı",
              hintStyle: GoogleFonts.ubuntu(
                color: textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 20),
        CosmosButton.button(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          text: "Kodu Yayınla",
          backgroundColor: bg,
          style: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          onTap: () async {
            if (projectName.text != "" &&
                projectAbout.text != "" &&
                projectLanguage.text != "" &&
                projectCode.text != "") {
              String tag = CosmosRandom.randomTag();
              String uid = await CosmosFirebase.getUID();
              await CosmosFirebase.add(
                reference: "code",
                tag: tag,
                value: [
                  uid,
                  tag,
                  projectName.text,
                  projectAbout.text,
                  projectLanguage.text,
                  projectCode.text,
                  CosmosTime.getNowTimeString(),
                ],
                onSuccess: () {
                  CosmosNavigator.pushDownFromTopReplacement(
                    context,
                    const SourceCode(),
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
        const SizedBox(height: 50),
      ],
    );
  }
}
