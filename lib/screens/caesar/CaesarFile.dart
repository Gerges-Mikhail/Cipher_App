import 'dart:ffi';

import 'package:clipboard/clipboard.dart';
import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:cs_project/common/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CaesarFile extends StatefulWidget {
  const CaesarFile({Key? key}) : super(key: key);

  @override
  State<CaesarFile> createState() => _CaesarFileState();
}
class _CaesarFileState extends State<CaesarFile> {
  String textFromFile = "text file from assets folder";
  getdata()async{
    String response = await rootBundle.loadString("assets/text.txt");
    setState((){
      textFromFile = response;
      _wordController.text = textFromFile;
    });
  }
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String result = "";
  String result2 = "";
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
        body: SingleChildScrollView(
          child: Background(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    // Text(
                    //   textFromFile,
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //   ),
                    // ),
                    TextField(
                      onTap: (){
                        setState((){
                          textFromFile;
                        });
                      },
                      maxLines: 3,
                      onChanged: (value) => setState(() => textFromFile = value),
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      controller: _wordController,
                      enabled: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 20,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ))),
                          child: CommonText(
                              text: "get data from text file",
                              size: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: "Amiri"),
                          onPressed: () {
                            setState((){
                              initState(){
                                _wordController.text = textFromFile;
                                super.initState();
                              };
                              getdata();
                            });

                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                      decoration: const InputDecoration(
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

                    SizedBox(
                      height: 5,
                    ),
                    CommonText(
                        text: "Output : ",
                        size: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                        fontFamily: "Pacifico"),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: 250,
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
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.green, fontSize: 20),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
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
              ),
            ),
          ),
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
    //String _text = textFromFile;
    String _temp = "";

    try {
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
      int ch = _text[i].codeUnitAt(0);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0)&& ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        showAlert("Invalid Text");
        _temp = "";
        break;
      }
      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26;
      }
      else {
        c = (ch - _key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }
    setState(() {
      result = _temp;
    });

  }
   caesar(_text,int _key){
    if(_key <0){
      return caesar(_text, _key+26);
    }
    var output = "";
    for(var i = 0 ; i<_text.length;i++ ){
      var char = _text[i];
      if(char.match(['a-z'])){
          var code = _text.charCodeAt(i);
          if(code >= 65 && code <= 90){
            char = String.fromCharCode(((code - 65 + _key ) % 26) + 65);
          }
          else if(code >= 97 && code <= 122){
            char = String.fromCharCode(((code - 97 + _key ) % 26) + 97);
          }
      }
      output += char;
    }
    return output;
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
