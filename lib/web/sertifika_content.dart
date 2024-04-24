import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SertifikaContentWeb extends StatefulWidget {
  final String id;
  const SertifikaContentWeb({super.key, required this.id});

  @override
  State<SertifikaContentWeb> createState() => _SertifikaContentWebState();
}

class _SertifikaContentWebState extends State<SertifikaContentWeb> {
  String name = "...";
  String no = "...";
  String profilePhoto = "...";
  String getID = "...";
  List<Widget> posts = [];
  getData() async {
    //uid,
    //tag,
    //ogrenciSertifikaNo.text,
    //CosmosTime.getNowTimeString(),
    //********************************************* */
    //ip, //0
    //userName.text, //1
    //email.text, //2
    //password.text, //3
    //name.text, //4
    //old.text, //5
    //school.text, //6
    //phone.text, //7
    //telegram.text, //8
    //discord.text, //9
    //"", //profile photos          //10
    //"Hey, selam akademi!", //bio  //11
    //CosmosTime.getNowTimeString(), //12
    getID = widget.id.replaceAll('"', "");
    List getDataCertificate =
        await CosmosFirebase.get('certificate/"$getID"', true);
    List getProfile =
        await CosmosFirebase.get('users/"${getDataCertificate[0]}"', true);
    name = getProfile[1];
    no = getID;
    profilePhoto = getProfile[11];

    List getData = await CosmosFirebase.getOnce("basarim");
    List dataReversed = CosmosTools.sortFromList(getData, 5);
    List datas = dataReversed.reversed.toList();
    for (List element in datas) {
      //uid,
      //tag,
      //baslik.text,
      //aciklama.text,
      //userID,
      //CosmosTime.getNowTimeString(),

      if (element[4] == getDataCertificate[0]) {
        posts.add(
          basarim(Icons.verified_outlined, element[2], element[3]),
        );
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.person,
      title: "Kişisel Sertifika",
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 4,
              color: defaultColor,
            ),
          ),
          child: ClipOval(
            child: CosmosImage(
              profilePhoto == "" ? "assets/user.png" : profilePhoto,
              width: 100,
              height: 100,
              errorImage: const AssetImage("assets/user.png"),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: GoogleFonts.poppins(
            color: defaultColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Kişisel Sertifika | Flutter",
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: width(context) * 0.3,
          child: Center(
            child: Text(
              "Sertifika Numarası",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width(context) * 0.3,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getID,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.4),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.copy,
                  size: 14,
                  color: defaultColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: width(context) * 0.3,
          child: Center(
            child: Text(
              "Tüm Başarımlar & Eğitmen Notları",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Column(
          children: posts,
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Container basarim(IconData icon, String title, String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: defaultColor,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  color: defaultColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            text,
            style: GoogleFonts.ubuntu(
              color: textColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
