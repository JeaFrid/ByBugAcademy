import 'package:opensource/page/page.dart';
import 'package:opensource/page/sertifika_content.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SertifikaWeb extends StatefulWidget {
  const SertifikaWeb({super.key});

  @override
  State<SertifikaWeb> createState() => _SertifikaWebState();
}

class _SertifikaWebState extends State<SertifikaWeb> {
  List<Widget> posts = [];
  getCertificate() async {
    Map<String, List> profiles = {};
    List getProfiles = await CosmosFirebase.getOnce("users");
    List getData = await CosmosFirebase.getOnce("certificate");
    List dataReversed = CosmosTools.sortFromList(getData, 3);
    List datas = dataReversed.reversed.toList();
    for (List element in getProfiles) {
      profiles.addAll({element[element.length - 1]: element});
    }
    for (List element in datas) {
      //uid,
      //tag,
      //ogrenciSertifikaNo.text,
      //CosmosTime.getNowTimeString(),
      List getMyProfile = profiles['"${element[0]}"']!;
      posts.add(
        sertifika(
          getMyProfile[10],
          getMyProfile[1],
          "Flutter",
          element[1],
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCertificate();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.pages,
      title: "Sertifikalar",
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            const CosmosImage(
              "assets/Flutter.png",
              width: 50,
              height: 50,
              errorImage: AssetImage("assets/soru.png"),
            ),
            const SizedBox(width: 10),
            Text(
              "Flutter",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Wrap(
                  children: posts,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget sertifika(
      String profilePhoto, String title, String language, String id) {
    return GestureDetector(
      onTap: () {
        CosmosNavigator.pushNonAnimatedReplacement(
            context, SertifikaContent(id: id));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 220,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: defaultColor,
                ),
              ),
              child: ClipOval(
                child: CosmosImage(
                  profilePhoto == "" ? "assets/user.png" : profilePhoto,
                  width: 60,
                  height: 60,
                  errorImage: const AssetImage("assets/user.png"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              language,
              style: GoogleFonts.poppins(
                color: defaultColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Sertifikayı Gör",
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.5),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
