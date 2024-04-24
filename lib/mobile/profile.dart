import 'package:opensource/page/page.dart';
import 'package:opensource/page/register.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/web/edit_profile.dart';
import 'package:opensource/widget/code.dart';
import 'package:opensource/widget/post.dart';
import 'package:opensource/widget/schema_btn.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMobile extends StatefulWidget {
  const ProfileMobile({super.key});

  @override
  State<ProfileMobile> createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {
  String profileText = "";
  String profileIDNumber = "";
  String uName = "...";
  String name = "...";
  String bio = "...";
  String telegram = "...";
  String discord = "...";
  String profilePhotos = "...";
  List<Widget> posts = [];
  getPost() async {
    posts.clear();
    String getMyUID = await CosmosFirebase.getUID();
    Map<String, List> profiles = {};
    List getProfiles = await CosmosFirebase.getOnce("users");

    List getData = await CosmosFirebase.getOnce("post");
    List dataReversed = CosmosTools.sortFromList(getData, 4);
    List datas = dataReversed.reversed.toList();
    for (List element in getProfiles) {
      profiles.addAll({element[element.length - 1]: element});
    }
    for (List element in datas) {
      //ip,
      //tag,
      //uid,
      //controller.text,
      //CosmosTime.getNowTimeString(),
      if (element[2] == getMyUID) {
        List getMyProfile = profiles['"${element[2]}"']!;
        String time = element[4];
        String hour = time.split(" ")[1].split(":")[0];
        String min = time.split(" ")[1].split(":")[1];

        posts.add(
          PostComponent(
            image: getMyProfile[10],
            title: getMyProfile[1],
            subtitle: "Herkese Açık",
            time: "$hour:$min",
            text: element[3],
          ),
        );
      }
    }
    if (posts.isNotEmpty) {
      profileText = "$uName Öğrencisinin Tüm Gönderileri!";
    } else {
      profileText = "$uName Hiçbir Gönderi Paylaşmadı.";
    }
    setState(() {});
  }

  getCode() async {
    posts.clear();
    String getMyUID = await CosmosFirebase.getUID();
    List getData = await CosmosFirebase.getOnce("code");
    List dataReversed = CosmosTools.sortFromList(getData, 6);
    List datas = dataReversed.reversed.toList();
    for (List dataList in datas) {
      //uid,
      //tag,
      //projectName.text,
      //projectAbout.text,
      //projectLanguage.text,
      //projectCode.text,
      //CosmosTime.getNowTimeString(),
      if (dataList[0] == getMyUID) {
        posts.add(
          CodeComponent(
            title: dataList[2],
            subtitle: dataList[3],
            code: dataList[5],
            language: dataList[4],
          ),
        );
      }
    }
    if (posts.isNotEmpty) {
      profileText = "$uName Öğrencisinin Tüm Kodları!";
    } else {
      profileText = "$uName Hiçbir Kod Paylaşmadı.";
    }
    setState(() {});
  }

  getProfile() async {
    String uid = '"${await CosmosFirebase.getUID()}"';
    profileIDNumber = uid.replaceAll('"', "");
    List getDataProfile = await CosmosFirebase.get("users/$uid", true);
    uName = getDataProfile[1];
    name = getDataProfile[4];
    bio = getDataProfile[11];
    telegram = getDataProfile[8];
    discord = getDataProfile[9];
    profilePhotos = getDataProfile[10];
    getPost();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.person,
      title: "Profilim",
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
              profilePhotos == "" ? "assets/user.png" : profilePhotos,
              width: 100,
              height: 100,
              errorImage: const AssetImage("assets/user.png"),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          uName,
          style: GoogleFonts.poppins(
            color: defaultColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: width(context) * 0.8,
          child: Center(
            child: Text(
              bio,
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
          width: width(context) * 0.8,
          child: Center(
            child: GestureDetector(
              onTap: () async {
                await copy(profileIDNumber).then((value) {
                  CosmosAlert.showToast(context,
                      child: const Text("Öğrenci Numarası Kopyalandı."));
                });
              },
              child: Text(
                profileIDNumber,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: textColor.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.telegram,
              color: textColor.withOpacity(0.2),
              size: 25,
            ),
            const SizedBox(width: 40),
            Icon(
              FontAwesomeIcons.discord,
              color: textColor.withOpacity(0.2),
              size: 25,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButton(
              "Profili Düzenle",
              onTap: () {
                CosmosNavigator.pushDownFromTop(
                  context,
                  const EditProfile(),
                );
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.white.withOpacity(0.2),
            ),
            myButton(
              "Çıkış Yap",
              onTap: () {
                CosmosFirebase.logout(() {}, () {});
                CosmosNavigator.pushDownFromTop(
                  context,
                  const Register(),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        CosmosBody(
          scrollDirection: Axis.horizontal,
          scrollable: true,
          children: [
            myButton(
              "Gönderiler",
              onTap: () async {
                if (telegram.contains("http://") ||
                    telegram.contains("https://")) {
                  await openUrl(telegram);
                } else {
                  await copy(telegram);
                  CosmosAlert.showMessage(
                    context,
                    "Telegram Kopyalandı.",
                    "Telegram kullanıcı adı kopyalandı.",
                    color: textColor,
                    backgroundColor: cColor,
                    button: "Tamam",
                  );
                }
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.white.withOpacity(0.2),
            ),
            myButton(
              "Kaynak Kodlar",
              onTap: () {
                getCode();
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.white.withOpacity(0.2),
            ),
            myButton(
              "Bağlamlar",
              onTap: () {
                posts.clear();
                profileText = "Bağlamlar henüz kullanılabilir değil.";
                setState(() {});
              },
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.white.withOpacity(0.2),
            ),
            myButton(
              "Projeler",
              onTap: () {
                posts.clear();
                profileText = "Projeler henüz kullanılabilir değil.";
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: width(context) * 0.8,
          child: Center(
            child: Text(
              profileText,
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
}
