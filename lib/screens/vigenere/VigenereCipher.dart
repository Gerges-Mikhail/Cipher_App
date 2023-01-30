import 'package:clipboard/clipboard.dart';
import 'package:cs_project/common/background.dart';
import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:cs_project/screens/vigenere/encrypt_and_decrypt.dart';
import 'package:flutter/material.dart';

class VigenereScreen extends StatefulWidget {
  const VigenereScreen({Key? key}) : super(key: key);
  @override
  State<VigenereScreen> createState() => _VigenereScreenState();
}

class _VigenereScreenState extends State<VigenereScreen> {
  String _result = "";
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
            'Vigenere Cipher',
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(width: 2, color: Colors.blue),
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
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(width: 2, color: Colors.blue),
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
                    SizedBox(
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
                                    Encrypt();
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
                                      Decrypt();
                                    }
                                  }),
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
                    SizedBox(
                      height: 5,
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
                              text: "Show English Alphabet",
                              size: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            showAlertDialog(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                            text: "Output : ",
                            size: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontFamily: "Pacifico"),
                        TextButton(
                          onPressed: () async {
                            FlutterClipboard.copy(_result).then(
                              (value) {
                                return ScaffoldMessenger.of(context).showSnackBar(
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
                    ResultsWidget(_result),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Encrypt() {
    String shift = _keyValue.text;
    String text = _plainText.text;
    VigenereCipher enc = new VigenereCipher(shift);
    _result = enc.encrypt(text);
    setState(() {});
  }

  void Decrypt() {
    var shift = _keyValue.text;
    var text = _plainText.text;
    VigenereCipher enc = new VigenereCipher(shift);
    _result = enc.decrypt(text);
    //dynamic changes
    setState(() {});
  }

  Widget ResultsWidget(_result) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(children: [
        Container(
          height: 200,
          width: 380,
          child: Card(
            elevation: 50,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 2),
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
                  style: TextStyle(color: Colors.green, fontSize: 35),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void delete() {
    _plainText.clear();
    _keyValue.clear();
    setState(() {
      _result = "";
    });
  }

  Future<void> showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(.8),
          title: Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_alert),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
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
