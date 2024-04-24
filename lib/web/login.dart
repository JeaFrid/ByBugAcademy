import 'package:opensource/page/home.dart';
import 'package:opensource/page/register.dart';
import 'package:opensource/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  bool visiblePassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CosmosBackgroundImage(
        image: "assets/bg.jpg",
        child: Center(
          child: Container(
            width: 400,
            height: 350,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4, 4),
                  color: Colors.black,
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              TextField(
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
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: textColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: defaultColor,
                                    ),
                                  ),
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
                              Row(
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
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: visiblePassword,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: textColor),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: defaultColor,
                                          ),
                                        ),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CosmosButton.borderButton(
                  text: "Akademi Giriş Yap",
                  color: textColor.withOpacity(0.5),
                  borderColor: textColor.withOpacity(0.5),
                  onTap: () async {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      CosmosFirebase.signIn(
                        email: email.text,
                        password: password.text,
                        trError: true,
                        onError: (error) {
                          CosmosAlert.showMessage(
                            context,
                            "Opps...",
                            error,
                            color: textColor,
                            backgroundColor: cColor,
                            button: "Tamam",
                          );
                        },
                        onSuccess: () {
                          CosmosNavigator.pushDownFromTop(
                              context, const HomePage());
                        },
                      );
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
                  text: "Hesabınız yok mu? Kayıt Ol!",
                  color: textColor.withOpacity(0.5),
                  borderColor: textColor.withOpacity(0),
                  onTap: () {
                    CosmosNavigator.pushDownFromTop(
                      context,
                      const Register(),
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
      ),
    );
  }
}
