import 'package:cs_project/screens/autokey/AutoKtyCipher.dart';
import 'package:cs_project/screens/caesar/CaesarFormText.dart';
import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/common/background.dart';
import 'package:cs_project/screens/caesar/caesarhome.dart';
import 'package:cs_project/screens/playfair/playfairhome.dart';
import 'package:cs_project/screens/vigenere/VigenereCipher.dart';
import 'package:flutter/material.dart';

import '../playfair/playfair.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    CommonText(
                        text: "Ciphers",
                        size: 35,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                        fontFamily: "Pacifico"),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      "assets/key.png",
                      width: 150,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CommonText(
                        text: "Please choose a cipher : ",
                        size: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                        fontFamily: "Pacifico"),
                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      width: 250,
                      height: 50,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                          child: CommonText(
                              text: "C a e s a r",
                              size: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            nextScreenReplace(context, CaesarHome());
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: CommonText(
                              text: "P l a y f a i r",
                              size: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            nextScreenReplace(context, PlayfairHome());
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                          ),
                          child: CommonText(
                              text: "A u t o K e y",
                              size: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            nextScreenReplace(context, AutoKeyScreen());
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                          ),
                          child: CommonText(
                              text: "V i g e n e r e",
                              size: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            nextScreenReplace(context, VigenereScreen());
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/copyright.png",
                    width: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "2022-copyright@ gerges mikhail",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
