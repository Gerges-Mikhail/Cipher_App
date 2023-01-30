import 'package:clipboard/clipboard.dart';
import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:cs_project/common/background.dart';
import 'package:flutter/material.dart';

class CaesarFormText extends StatefulWidget {
  const CaesarFormText({Key? key}) : super(key: key);

  @override
  State<CaesarFormText> createState() => _CaesarFormTextState();
}
class _CaesarFormTextState extends State<CaesarFormText> {
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String result = "";
  late int _key;
  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Background(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
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
                        controller: _wordController,
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
                        controller: _keyController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10,
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
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                  child: CommonText(
                                      text: "Encrypt",
                                      size: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: "Amiri"),
                                  onPressed: () {
                                    this.encrypt(true);
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
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                  child: CommonText(
                                      text: "Decrypt",
                                      size: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: "Amiri"),
                                  onPressed: () {
                                      this.decrypt(false);
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
                                    backgroundColor: MaterialStateProperty.all(Colors.red),
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
                              backgroundColor: MaterialStateProperty.all(Colors.white),
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
                              FlutterClipboard.copy(result)
                                  .then(
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
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                            ),
                            child: const Text(
                              'Copy',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                          width: 380,
                          child:
                          Card(
                            elevation: 50,
                            color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.blue,
                                  width: 2
                                ),
                                  borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.015,
                                left: MediaQuery.of(context).size.height * 0.015,
                                right: MediaQuery.of(context).size.height * 0.015,
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                  child: Center(
                                    child: Text(result,
                                      style: TextStyle(color: Colors.green, fontSize: 35),),
                                  ),
                                ),
                      ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
    );

  }

  void delete() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      result = "";
    });
  }

  void encrypt(bool _isEncrypt) {
    String _text = _wordController.text;
    String _temp = "";
    try {
      //convert string to number
      _key = int.parse(_keyController.text);
    } catch (e) {
      showAlert("Invalid Key");
    }
    op(_text, _temp, _key, _isEncrypt);
  }

  void decrypt(bool _isEncrypt) {
    String _text = _wordController.text;
    String _temp = "";
    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      showAlert("Invalid Key");
    }

    op(_text, _temp, _key, _isEncrypt);
  }

  void op(String _text,String _temp ,int _key,bool _isEncrypt){
    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      //small char
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      }
      //Capital char
      else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      }
      //spaces
      else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        showAlert("Invalid Text");
        _temp = "";
        break;
      }
      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26; // number
      }
      else {
        c = (ch - _key - offset) % 26;
      }
      //convert number to string
      h = String.fromCharCode(c + offset);
      _temp += h;
    }
    setState(() {
      result = _temp;
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
