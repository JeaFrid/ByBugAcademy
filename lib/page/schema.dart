import 'package:opensource/page/add_basari.dart';
import 'package:opensource/mobile/menu.dart';
import 'package:opensource/page/add_code.dart';
import 'package:opensource/page/add_sertifika.dart';
import 'package:opensource/page/baglam.dart';
import 'package:opensource/page/coming.dart';
import 'package:opensource/page/ders.dart';
import 'package:opensource/page/home.dart';
import 'package:opensource/page/profile.dart';
import 'package:opensource/page/sertifika.dart';
import 'package:opensource/page/sourcecode.dart';
import 'package:opensource/widget/alert.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

bool admin = false;
int navIndex = 0;

class Schema extends StatefulWidget {
  final List<Widget> children;
  const Schema({super.key, required this.children});

  @override
  State<Schema> createState() => _SchemaState();
}

class _SchemaState extends State<Schema> {
  String uName = "XXXXXXXXX";

  String name = "...";
  String bio = "...";
  String telegram = "...";
  String discord = "...";
  String profilePhotos = "...";
  bool isMobile(BuildContext context) {
    if (width(context) < 1500) {
      return true;
    } else {
      return false;
    }
  }

  getData() async {
    String uid = await CosmosFirebase.getUID();
    List getDataProfile = await CosmosFirebase.get('users/"$uid"', true);
    List getAdminList = await CosmosFirebase.getOnce("admin");
    for (var element in getAdminList) {
      if (uid == element[0]) {
        setState(() {
          admin = true;
        });
      }
    }
    uName = getDataProfile[1];
    name = getDataProfile[4];
    bio = getDataProfile[11];
    telegram = getDataProfile[8];
    discord = getDataProfile[9];
    profilePhotos = getDataProfile[10];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isMobile(context) == true ? mobile(context) : pc(context);
  }

  Scaffold mobile(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CosmosNavigation(
        backgroundColor: navColor,
        activeColor: textColor,
        inactiveColor: textColor.withOpacity(0.5),
        visible: true,
        activeIndex: navIndex,
        icons: const [
          Icons.home,
          Icons.construction_rounded,
          Icons.grid_view_rounded,
          Icons.school,
          Icons.person,
        ],
        onTap: (int index) {
          if (index == 0) {
            setState(() {
              navIndex = 0;
            });
            CosmosNavigator.pushNonAnimatedReplacement(
                context, const HomePage());
          }
          if (index == 1) {
            setState(() {
              navIndex = 1;
            });
            CosmosNavigator.pushNonAnimatedReplacement(
                context, const SourceCode());
          }
          if (index == 2) {
            setState(() {
              navIndex = 2;
            });
            CosmosNavigator.pushNonAnimatedReplacement(
                context, const MenuMobile());
          }
          if (index == 3) {
            setState(() {
              navIndex = 3;
            });
            CosmosNavigator.pushNonAnimatedReplacement(
                context, const DersProgrami());
          }
          if (index == 4) {
            setState(() {
              navIndex = 4;
            });
            CosmosNavigator.pushNonAnimatedReplacement(
                context, const Profile());
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 4,
                        color: defaultColor,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.school,
                        color: textColor,
                        size: 25,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "ByBug Academy",
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Mobil Uygulaması",
                    style: GoogleFonts.poppins(
                      color: textColor.withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: navColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CosmosBody(
                  scrollable: true,
                  scrollDirection: Axis.vertical,
                  children: widget.children,
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Scaffold pc(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: defaultColor,
                      size: 35,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "ByBug Academy",
                      style: GoogleFonts.poppins(
                        color: defaultColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // myButton(
                    //   "Portöy",
                    //   onTap: () {},
                    // ),
                    // myButton(
                    //   "Servisler",
                    //   onTap: () {},
                    // ),
                    // myButton(
                    //   "Müfredat",
                    //   onTap: () {},
                    // ),
                    // myButton(
                    //   "Hakkımızda",
                    //   onTap: () {},
                    // ),
                    const SizedBox(width: 12),
                    Container(
                      height: 40,
                      width: 2,
                      color: Colors.transparent,
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () async {
                        CosmosNavigator.pushDownFromTop(
                            context, const Profile());
                      },
                      child: Row(
                        children: [
                          Text(
                            uName,
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
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
                                profilePhotos,
                                width: 30,
                                height: 30,
                                errorImage: const AssetImage("assets/user.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 5, bottom: 30),
                height: height(context) * 0.90,
                width: 300,
                decoration: BoxDecoration(
                  color: navColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: CosmosBody(
                  scrollable: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "ByBug Academy",
                            style: GoogleFonts.poppins(
                              color: defaultColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: menuButton(
                            Icons.home,
                            "Anasayfa",
                            noPadding: true,
                            () {
                              CosmosNavigator.pushNonAnimated(
                                context,
                                const HomePage(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        menuButtonIcon(
                          Icons.add,
                          noPadding: true,
                          () async {
                            await postPublish(
                              context,
                              onFinished: () {
                                CosmosNavigator.pushDownFromTopReplacement(
                                    context, const HomePage());
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: menuButton(
                            Icons.code,
                            "Açık Kaynak Kodlar",
                            () {
                              CosmosNavigator.pushNonAnimated(
                                context,
                                const SourceCode(),
                              );
                            },
                            noPadding: true,
                          ),
                        ),
                        const SizedBox(width: 5),
                        menuButtonIcon(
                          Icons.add,
                          noPadding: true,
                          () async {
                            CosmosNavigator.pushNonAnimatedReplacement(
                                context, const AddSCode());
                          },
                        ),
                      ],
                    ),
                    menuButton(
                      Icons.data_object,
                      "Sunucular",
                      () {
                        CosmosNavigator.pushNonAnimated(
                          context,
                          const ComingSoon(
                            icon: Icons.data_object,
                            title: "Sunucular",
                          ),
                        );
                      },
                    ),
                    menuButton(
                      Icons.pages,
                      "Sertifikalar",
                      () async {
                        CosmosNavigator.pushNonAnimatedReplacement(
                            context, const Sertifika());
                      },
                    ),
                    menuButton(
                      Icons.school_outlined,
                      "Ders Programı",
                      () {
                        CosmosNavigator.pushNonAnimated(
                          context,
                          const DersProgrami(),
                        );
                      },
                    ),
                    menuButton(
                      Icons.link,
                      "Sosyal Medya",
                      () {
                        CosmosNavigator.pushNonAnimated(
                          context,
                          const ComingSoon(
                            icon: Icons.link,
                            title: "Sosyal Medya",
                          ),
                        );
                      },
                    ),
                    menuButton(
                      Icons.screen_rotation_alt_sharp,
                      "Bağlamlar",
                      () {
                        CosmosNavigator.pushNonAnimatedReplacement(
                            context, const Baglamlar());
                      },
                    ),
                    menuButton(
                      Icons.person,
                      "Profilim",
                      () async {
                        CosmosNavigator.pushNonAnimatedReplacement(
                            context, const Profile());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Kırmızı Patika",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    menuButton(
                      Icons.analytics_outlined,
                      "İstatistikler",
                      () {
                        CosmosNavigator.pushNonAnimated(
                          context,
                          const ComingSoon(
                            icon: Icons.analytics_outlined,
                            title: "İstatistikler",
                          ),
                        );
                      },
                    ),
                    menuButton(
                      Icons.verified_outlined,
                      "Katıl Aboneleri",
                      () {
                        CosmosNavigator.pushNonAnimated(
                          context,
                          const ComingSoon(
                            icon: Icons.verified_outlined,
                            title: "Katıl Aboneleri",
                          ),
                        );
                      },
                    ),
                    admin == true
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Yönetim Alanı",
                                      style: GoogleFonts.poppins(
                                        color: Colors.amber,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              menuButton(
                                Icons.monitor_heart_outlined,
                                "Sistem Monitörü",
                                () {
                                  CosmosNavigator.pushNonAnimatedReplacement(
                                      context, const AddBasarim());
                                },
                              ),
                              menuButton(
                                Icons.library_add,
                                "Yeni Sertifika",
                                () {
                                  CosmosNavigator.pushNonAnimatedReplacement(
                                      context, const AddSertifika());
                                },
                              ),
                              menuButton(
                                Icons.library_add,
                                "Yeni Başarım",
                                () {
                                  CosmosNavigator.pushNonAnimatedReplacement(
                                      context, const AddBasarim());
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 5, bottom: 30),
                  height: height(context) * 0.90,
                  decoration: BoxDecoration(
                    color: navColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CosmosBody(
                    scrollable: true,
                    scrollDirection: Axis.vertical,
                    children: widget.children,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuButton(IconData icon, String text, void Function()? onTap,
      {bool? noPadding}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: noPadding == true
            ? const EdgeInsets.only(
                left: 8,
                top: 2,
                bottom: 2,
              )
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2,
            color: textColor.withOpacity(0.01),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon,
              color: textColor.withOpacity(0.7),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuButtonIcon(IconData icon, void Function()? onTap,
      {bool? noPadding}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: noPadding == true
            ? const EdgeInsets.only(
                right: 8,
                top: 2,
                bottom: 2,
              )
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2,
            color: textColor.withOpacity(0.01),
          ),
        ),
        child: Icon(
          icon,
          color: textColor.withOpacity(0.7),
          size: 20,
        ),
      ),
    );
  }
}
