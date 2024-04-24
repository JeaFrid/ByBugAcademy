import 'package:opensource/page/page.dart';
import 'package:opensource/page/profile.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController userName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController old = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController telegram = TextEditingController();
  TextEditingController discord = TextEditingController();
  String image = "";
  getData() async {
    String uid = await CosmosFirebase.getUID();
    List getProfile = await CosmosFirebase.get('users/"$uid"', true);
    //  ip, //0
    //  userName.text, //1
    //  email.text, //2
    //  password.text, //3
    //  name.text, //4
    //  old.text, //5
    //  school.text, //6
    //  phone.text, //7
    //  telegram.text, //8
    //  discord.text, //9
    //  "", //profile photos          //10
    //  "Hey, selam akademi!", //bio  //11
    //  CosmosTime.getNowTimeString(), //12
    userName.text = getProfile[1];
    email.text = getProfile[2];
    bio.text = getProfile[11];
    name.text = getProfile[4];
    old.text = getProfile[5];
    school.text = getProfile[6];
    phone.text = getProfile[7];
    telegram.text = getProfile[8];
    discord.text = getProfile[9];
    image = getProfile[10];
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
      icon: Icons.edit,
      title: "Profili Düzenle",
      children: [
        Text(
          "Profili Düzenle",
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.7),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Profil Fotoğrafını Değiştir",
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: width(context) < 1000 ? double.infinity : 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: defaultColor,
                      ),
                    ),
                    child: CosmosImage(
                      image == "" ? "assets/user.png" : image,
                      width: 70,
                      height: 70,
                      errorImage: const AssetImage("assets/user.png"),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: defaultColor,
                size: 30,
              ),
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
                    image == "" ? "assets/user.png" : image,
                    width: 70,
                    height: 70,
                    errorImage: const AssetImage("assets/user.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () async {
            CosmosAlert.loadingIOS(context);
            await CosmosFirebase.imagePickAndStoreFireStorage().then(
              (value) {
                if (value != null) {
                  setState(() {
                    image = value;
                  });

                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
            );
          },
          child: Container(
            width: width(context) < 1000 ? double.infinity : 500,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Profili Fotoğrafını Değiştir",
                style: GoogleFonts.poppins(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              image = "";
            });
          },
          child: Container(
            width: width(context) < 1000 ? double.infinity : 500,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Profili Fotoğrafını Kaldır",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          "Profil Bilgilerini Değiştir",
          style: GoogleFonts.poppins(
            color: textColor.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: width(context) < 1000 ? double.infinity : 516,
          child: Column(
            children: [
              const SizedBox(height: 20),
              userNameMethod(context),
              const SizedBox(height: 5),
              bioMethod(context),
              //const SizedBox(height: 5),
              //emailMethod(context),
              const SizedBox(height: 5),
              nameMethod(context),
              const SizedBox(height: 5),
              oldMethod(context),
              const SizedBox(height: 5),
              schollMethod(context),
              const SizedBox(height: 5),
              phoneMethod(context),
              const SizedBox(height: 5),
              telegramMethod(context),
              const SizedBox(height: 5),
              discordMethod(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            String uid = await CosmosFirebase.getUID();
            List getProfile = await CosmosFirebase.get('users/"$uid"', true);
            //  ip, //0
            //  userName.text, //1
            //  email.text, //2
            //  password.text, //3
            //  name.text, //4
            //  old.text, //5
            //  school.text, //6
            //  phone.text, //7
            //  telegram.text, //8
            //  discord.text, //9
            //  "", //profile photos          //10
            //  "Hey, selam akademi!", //bio  //11
            //  CosmosTime.getNowTimeString(), //12

            if (userName.text.isNotEmpty &&
                email.text.isNotEmpty &&
                name.text.isNotEmpty &&
                old.text.isNotEmpty &&
                school.text.isNotEmpty &&
                phone.text.isNotEmpty &&
                telegram.text.isNotEmpty &&
                discord.text.isNotEmpty) {
              if (phone.text.length == 10) {
                List newList = [
                  getProfile[0],
                  userName.text,
                  getProfile[2],
                  getProfile[3],
                  name.text,
                  old.text,
                  school.text,
                  phone.text,
                  telegram.text,
                  discord.text,
                  image,
                  bio.text,
                  getProfile[12],
                ];

                await CosmosFirebase.add(
                  reference: "users",
                  tag: uid,
                  value: newList,
                  onError: () {
                    CosmosAlert.showMessage(
                      // ignore: use_build_context_synchronously
                      context,
                      "Opps...",
                      "Bir problem oluştu.",
                      color: textColor,
                      backgroundColor: cColor,
                      button: "Tamam",
                    );
                  },
                  onSuccess: () {
                    CosmosNavigator.pushDownFromTopReplacement(
                      context,
                      const Profile(),
                    );
                  },
                );
              } else {
                CosmosAlert.showMessage(
                  // ignore: use_build_context_synchronously
                  context,
                  "Opps...",
                  "Telefon numarasını hatalı girdiniz. Başına 0 koymadan, 10 haneli olacak şekilde girin.\n\nÖRNEK; 5005005050",
                  color: textColor,
                  backgroundColor: cColor,
                  button: "Tamam",
                );
              }
            } else {
              CosmosAlert.showMessage(
                // ignore: use_build_context_synchronously
                context,
                "Opps...",
                "Lütfen tüm alanları doldurun.",
                color: textColor,
                backgroundColor: cColor,
                button: "Tamam",
              );
            }
          },
          child: Container(
            width: width(context) < 1000 ? double.infinity : 500,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Profili Güncelle",
                style: GoogleFonts.poppins(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget discordMethod(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: discord,
        style: GoogleFonts.ubuntu(
          color: textColor,
          fontSize: 14,
        ),
        cursorColor: defaultColor,
        maxLines: 1,
        readOnly: false,
        keyboardType: TextInputType.name,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z1234567890._-]')),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelText: "Discord",
          labelStyle: GoogleFonts.ubuntu(
            color: textColor.withOpacity(0.5),
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Row telegramMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: telegram,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: 1,
              readOnly: false,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z1234567890._-]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: "Telegram",
                labelStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Row phoneMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: phone,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: 1,
              readOnly: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[1234567890]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: "Telefon Numarası",
                labelStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Row schollMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: school,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: 1,
              readOnly: false,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-ZüÜöÖçÇİığĞ ]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: "Okul",
                labelStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Row oldMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: old,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              cursorColor: defaultColor,
              maxLines: 1,
              maxLength: 2,
              readOnly: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[1234567890]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: "Yaş",
                labelStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Row nameMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: name,
              style: GoogleFonts.ubuntu(
                color: textColor,
                fontSize: 14,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-ZüÜöÖçÇİığĞ ]')),
              ],
              cursorColor: defaultColor,
              maxLines: 1,
              readOnly: false,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: "Ad ve Soyad",
                labelStyle: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Row emailMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: email,
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
                      focusedBorder: InputBorder.none,
                      labelText: "E-Posta",
                      labelStyle: GoogleFonts.ubuntu(
                        color: textColor.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    onChanged: (text) {
                      if (text.length > 3) {
                        if (text.contains("@") == false) {
                          email.text = "$text@gmail.com";
                          TextSelection newSelection =
                              const TextSelection.collapsed(offset: 4);
                          email.selection = newSelection;
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row userNameMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: userName,
                    style: GoogleFonts.ubuntu(
                      color: textColor,
                      fontSize: 14,
                    ),
                    cursorColor: defaultColor,
                    maxLines: 1,
                    readOnly: false,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      labelText: "Kullanıcı Adı",
                      labelStyle: GoogleFonts.ubuntu(
                        color: textColor.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row bioMethod(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: bio,
                    style: GoogleFonts.ubuntu(
                      color: textColor,
                      fontSize: 14,
                    ),
                    cursorColor: defaultColor,
                    maxLines: 10,
                    readOnly: false,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      labelText: "Biyografi",
                      labelStyle: GoogleFonts.ubuntu(
                        color: textColor.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
