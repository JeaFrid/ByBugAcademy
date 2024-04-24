import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SystemMonitoruWeb extends StatefulWidget {
  const SystemMonitoruWeb({super.key});

  @override
  State<SystemMonitoruWeb> createState() => _SystemMonitoruWebState();
}

class _SystemMonitoruWebState extends State<SystemMonitoruWeb> {
  List<Widget> userList = [];
  List<Widget> postList = [];
  Future<void> getUsers() async {
    List getData = await CosmosFirebase.getOnce("users");
    List dataReversed = CosmosTools.sortFromList(getData, 12);
    List datas = dataReversed.reversed.toList();
    for (List element in datas) {
      userList.add(
        user(
          element[10],
          element[1],
          element[4],
          element[element.length - 1],
        ),
      );
    }
    setState(() {});
  }

  Future<void> getPost() async {
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

      List getMyProfile = profiles['"${element[2]}"']!;
      String time = element[4];
      String hour = time.split(" ")[1].split(":")[0];
      String min = time.split(" ")[1].split(":")[1];
      postList.add(
        post(
          getMyProfile[10],
          getMyProfile[1],
          element[3],
          element[2],
          "$hour:$min",
        ),
      );
    }
    setState(() {});
  }

  getDatas() async {
    await getUsers();
    await getPost();
  }

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.monitor_heart_outlined,
      title: "Sistem Monitörü",
      children: [
        CosmosBody(
          scrollable: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: 500,
              height: 700,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CosmosBody(
                scrollable: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Kullanıcı Veritabanı",
                      style: GoogleFonts.poppins(
                        color: textColor.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: userList,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: 500,
              height: 700,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CosmosBody(
                scrollable: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Gönderi Veritabanı",
                      style: GoogleFonts.poppins(
                        color: textColor.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: postList,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: 500,
              height: 700,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CosmosBody(
                scrollable: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Veri Yok",
                      style: GoogleFonts.poppins(
                        color: textColor.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Column(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget user(String profilePhotos, String title, String subtitle, String id) {
    return CosmosMenu.builder(
      context,
      backgroundColor: navColor,
      items: [
        CosmosMenu.iconItem(
          Icons.remove_red_eye,
          "Profili Gör",
          textColor: textColor,
        ),
        CosmosMenu.iconItem(
          Icons.delete,
          "Profili Kaldır",
          textColor: textColor,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        width: 500,
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipOval(
              child: CosmosImage(
                profilePhotos == "" ? "assets/user.png" : profilePhotos,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: textColor.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget post(
    String profilePhotos,
    String title,
    String subtitle,
    String id,
    String time,
  ) {
    return CosmosMenu.builder(
      context,
      backgroundColor: navColor,
      items: [
        CosmosMenu.iconItem(
          Icons.delete,
          "Gönderiyi Kaldır",
          textColor: textColor,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        width: 500,
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipOval(
              child: CosmosImage(
                profilePhotos,
                width: 50,
                height: 50,
                errorImage: const AssetImage("assets/user.png"),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: textColor.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: GoogleFonts.poppins(
                          color: textColor.withOpacity(0.4),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
