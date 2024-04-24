import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaglamlarMobile extends StatelessWidget {
  const BaglamlarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.screen_rotation_alt_sharp,
      title: "Bağlamlar",
      children: [
        Column(
          children: [
            baglam(
              "ByBug Book's",
              "ByBug Books, herkesin yaratıcılığını serbest bırakabileceği, dijital kitaplarını yazabileceği ve dünyayla paylaşabileceği bir platform sunan sosyal bir dijital e-kitap uygulamasıdır.",
              "https://play.google.com/store/apps/details?id=net.bybug.book",
            ),
            baglam(
              "ByBug Policy",
              "ByBug Policy, gizlilik politikası, kullanım koşulları ve çerez politikası metinlerini hızlı ve kolay bir şekilde oluşturmanızı sağlayan bir mobil uygulamadır. Web sitesi veya uygulamanız için gereken tüm politika metinlerini oluşturmak için tek bir yerde!",
              "https://play.google.com/store/apps/details?id=net.bybug.policyapp",
            ),
            baglam(
              "ByBug Lab",
              "ByBug Laboratuvar'ı içerisinde pek çok konuda araştırma yapabilir ve istediğiniz içeriklere hızla erişebilirsiniz!",
              "https://lab.bybug.net",
            ),
            baglam(
              "ByBug Web",
              "ByBug Resmi Sitesi",
              "https://bybug.net",
            ),
          ],
        ),
      ],
    );
  }

  Widget baglam(String title, String subtitle, String url) {
    double width = double.infinity;
    double height = 200;
    return GestureDetector(
      onTap: () async {
        await openUrl(url);
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bg,
                  border: Border.all(
                    width: 2,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CosmosImage(
                    "assets/bg.jpg",
                    width: width,
                    height: height,
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Icon(
                      Icons.screen_rotation_alt_sharp,
                      size: 80,
                      color: textColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: defaultColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            subtitle,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
