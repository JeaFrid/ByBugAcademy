import 'package:opensource/page/add_basari.dart';
import 'package:opensource/page/add_code.dart';
import 'package:opensource/page/add_sertifika.dart';
import 'package:opensource/page/baglam.dart';
import 'package:opensource/page/coming.dart';
import 'package:opensource/page/ders.dart';
import 'package:opensource/page/home.dart';
import 'package:opensource/page/page.dart';
import 'package:opensource/page/profile.dart';
import 'package:opensource/page/schema.dart';
import 'package:opensource/page/sertifika.dart';
import 'package:opensource/page/sourcecode.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/widget/alert.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuMobile extends StatefulWidget {
  const MenuMobile({super.key});

  @override
  State<MenuMobile> createState() => _MenuMobileState();
}

class _MenuMobileState extends State<MenuMobile> {
  getData() async {
    String uid = await CosmosFirebase.getUID();
    List getAdminList = await CosmosFirebase.getOnce("admin");
    for (var element in getAdminList) {
      if (uid == element[0]) {
        setState(() {
          admin = true;
        });
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
      icon: Icons.grid_view_rounded,
      title: "Menü",
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
                CosmosNavigator.pushNonAnimated(context, const AddSCode());
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
            CosmosNavigator.pushNonAnimated(context, const Sertifika());
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
            CosmosNavigator.pushNonAnimated(context, const Baglamlar());
          },
        ),
        menuButton(
          Icons.person,
          "Profilim",
          () async {
            CosmosNavigator.pushNonAnimated(context, const Profile());
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
                    Icons.library_add,
                    "Yeni Sertifika",
                    () {
                      CosmosNavigator.pushNonAnimated(
                          context, const AddSertifika());
                    },
                  ),
                  menuButton(
                    Icons.library_add,
                    "Yeni Başarım",
                    () {
                      CosmosNavigator.pushNonAnimated(
                          context, const AddBasarim());
                    },
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 10),
      ],
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
