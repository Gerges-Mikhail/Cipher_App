import 'package:clipboard/clipboard.dart';
import 'package:cs_project/common/background.dart';
import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/autokey/AutoKeyDe.dart';
import 'package:cs_project/screens/autokey/encryptautokey.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AutoKeyScreen extends StatefulWidget {
  const AutoKeyScreen({Key? key}) : super(key: key);
  @override
  State<AutoKeyScreen> createState() => _AutoKeyScreenState();
}

class _AutoKeyScreenState extends State<AutoKeyScreen> {
  String _result = "";
  String finalkey = "";
  String oldtext = "";
  String cipherText = "";
  bool isEnctypt = false;
  final TextEditingController _plainText = TextEditingController();
  final TextEditingController _keyValue = TextEditingController();

  @override
  void dispose() {
    _plainText.dispose();
    _keyValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(.5),
          elevation: 10,
          title: const Text(
            'AutoKey Cipher',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                nextScreenReplace(context, const Home());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Background(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xffF02E65)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                          ),
                          labelText: 'Write text here : ',
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontFamily: "Amiri",
                          )),
                      controller: _plainText,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xffF02E65)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                          ),
                          labelText: 'Write the key here : ',
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: "Amiri",
                          )),
                      controller: _keyValue,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 50,
                            child: Card(
                              elevation: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: CommonText(
                                    text: "Encrypt",
                                    size: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Amiri"),
                                onPressed: () {
                                  if (_plainText.text.isEmpty ||
                                      _keyValue.text.isEmpty) {
                                    showAlert("invalid text");
                                  } else {
                                    _Encrypt();
                                    oldtext = _plainText.text;
                                    cipherText = _result;
                                    setState((){
                                      isEnctypt = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Card(
                              elevation: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: CommonText(
                                    text: "Decrypt",
                                    size: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Amiri"),
                                onPressed: () {
                                  if (_plainText.text.isEmpty ||
                                      _keyValue.text.isEmpty) {
                                    showAlert("invalid text");
                                  } else {
                                    _Decrypt();
                                    _plainText.clear();
                                    _keyValue.clear();
                                    setState(() {
                                      isEnctypt = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Card(
                              elevation: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: CommonText(
                                    text: "Clear",
                                    size: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Amiri"),
                                onPressed: () {
                                  delete();
                                },
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                            text: isEnctypt ? 'Plaint Message : ' : 'Cipher Message : ',
                            size: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontFamily: "Pacifico"),
                        MessageWidget(),
                      ],
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                            text: "Key used : ",
                            size: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontFamily: "Pacifico"),
                        isEnctypt? KeyEncryptWidget(finalkey) : KeyDycryptWidget(_keyValue.text),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ResultsWidget(_result),
                        TextButton(
                          onPressed: () async {
                            FlutterClipboard.copy(_result).then(
                              (value) {
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text('Text Copied'),
                                  ),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent),
                          ),
                          child: const Text(
                            'Copy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ResultsWidget(_result) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Column(children: [
        Container(
          height: 150,
          width: 350,
          child: Card(
            elevation: 50,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.015,
              left: MediaQuery.of(context).size.height * 0.015,
              right: MediaQuery.of(context).size.height * 0.015,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: Text(
                  _result,
                  style: const TextStyle(color: Colors.green, fontSize: 35),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget KeyEncryptWidget(_finalkey) {
    var input = _plainText.text;
    input = input.replaceAll(' ', '');
    var keyva = _keyValue.text;
    String matrix = keyva;
    keyva = input.replaceAll(' ', '');
    var i = 0;
    while (matrix.length < input.length) {
      matrix += input[i];
      i++;
    }
    finalkey = matrix;
    setState(() {});
    return Text(
      finalkey,
      style: const TextStyle(fontSize: 20, color: Colors.blue),
    );
  }
  Widget KeyDycryptWidget(_finalkey) {
    var key = _keyValue.text;
    var ciphertext = _plainText.text;
    String matrix = key;
    var g = 0;
    String finalkey = "";
    finalkey.toUpperCase();
    finalkey.replaceAll(' ', '');
    while (matrix.length < ciphertext.length) {
      matrix += oldtext[g];
      g++;
    }
    finalkey = matrix;
    setState(() {});
    return Text(
      finalkey,
      style: const TextStyle(fontSize: 20, color: Colors.blue),
    );
  }
  Widget MessageWidget() {
    return Text(
      isEnctypt ? _plainText.text : cipherText,
      style: const TextStyle(fontSize: 20, color: Colors.blue),
    );
  }

  void _Encrypt() {
    String key = _keyValue.text;
    String text = _plainText.text;
    AutoKeyCipher enc = new AutoKeyCipher();
    _result = enc.encrypt(key, text);
    setState(() {});
  }

  void _Decrypt() {
    var key = _keyValue.text;
    var ciphertext = _plainText.text;
    String matrix = key;
    var g = 0;
    String finalkey = "";
    finalkey.toUpperCase();
    finalkey.replaceAll(' ', '');
    while (matrix.length < ciphertext.length) {
      matrix += oldtext[g];
      g++;
    }
    finalkey = matrix;
    AutoKeyCipherDe enc = new AutoKeyCipherDe();
    _result = enc.decrypt(ciphertext, finalkey);
    setState(() {});
  }

  void delete() {
    _plainText.clear();
    _keyValue.clear();
    setState(() {
      _result = "";
      finalkey = "";
    });

  }

  Future<void> showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(.8),
          title: const Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_alert),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
