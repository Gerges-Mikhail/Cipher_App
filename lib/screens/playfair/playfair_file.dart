import 'dart:ffi';

import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:cs_project/common/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlayfairFile extends StatefulWidget {
  const PlayfairFile({Key? key}) : super(key: key);

  @override
  State<PlayfairFile> createState() => _PlayfairFileState();
}
class _PlayfairFileState extends State<PlayfairFile> {
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
        body: Background(
          child: SingleChildScrollView(
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
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                ),
                                child: CommonText(
                                    text: "Encrypt",
                                    size: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Amiri"),
                                onPressed: () {
                                  if (_wordController.text.isEmpty ||
                                      _keyController.text.isEmpty) {
                                    showAlert("invalid text");
                                  }
                                  else {
                                    this.playfairEncrypt(
                                        _wordController.text,
                                        _keyController.text);
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
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                ),
                                child: CommonText(
                                    text: "Decrypt",
                                    size: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: "Amiri"),
                                onPressed: () {
                                  if (_wordController.text.isEmpty ||
                                      _keyController.text.isEmpty) {
                                    showAlert("invalid text");
                                  }
                                  else {
                                    this.playfairDecrypt(
                                        _wordController.text,
                                        _keyController.text);
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
                                style: TextStyle(color: Colors.green, fontSize: 30),),
                            ),
                          ),
                        ),
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
  String playfairDecrypt(String text, String key) {
    String table = '', result1 = '';
    text = text.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    text = text.toLowerCase();
    key = key.toLowerCase();
    List<String> chek = [];
    if (text.length % 2 == 0 || text.length == chek.length) {
      var matrix = List.generate(5, (i) => List.filled(5, '', growable: false)),
          index = 0;

      for (var i = 0; i < key.length; i++) {
        if (table.contains(key[i]) == false) {
          if (key[i] != 'j') table += key[i];
        }
      }

      for (var i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
        if (table.contains(String.fromCharCode(i)) == false &&
            String.fromCharCode(i) != 'j') {
          table += String.fromCharCode(i);
        }
      }

      for (var i = 0; i < 5; i++) {
        for (var j = 0; j < 5; j++) {
          matrix[i][j] = table[index++];
        }
      }

      for (var i = 0; i < text.length; i += 2) {
        late int row1, row2, col1, col2;
        for (var j = 0; j < 5; j++) {
          if (matrix[j].contains(text[i]) == true) {
            row1 = j;
            col1 = matrix[j].indexOf(text[i]);
          }
          if (matrix[j].contains(text[i + 1]) == true) {
            row2 = j;
            col2 = matrix[j].indexOf(text[i + 1]);
          }
        }
        if (row1 == row2) {
          result1 += matrix[row1][(col1 - 1) % 5];
          result1 += matrix[row2][(col2 - 1) % 5];
        } else if (col1 == col2) {
          result1 += matrix[(row1 - 1) % 5][col1];
          result1 += matrix[(row2 - 1) % 5][col2];
        } else {
          result1 += matrix[row1][col2];
          result1 += matrix[row2][col1];
        }
      }

      setState(() {
        result = result1;
      });
      return result1;
    }
    else {
      showAlert("Can't decrypt because the text is not valid");
    }
    return result1;
  }

  String playfairEncrypt(String text, String key) {
    String table = '',
        resultp = '';
    text = text.replaceAll(' ', '');
    text = text.replaceAll('j', 'i');
    key = key.replaceAll(' ', '');
    text = text.toLowerCase();
    key = key.toLowerCase();

    for (var i = 0; i < text.length - 1; i++) {
      if (text[i] == text[i + 1])
        text =
            text.substring(0, i + 1) + 'x' + text.substring(i + 1, text.length);
    }
    if (text.length % 2 != 0) text += 'x';

    var matrix = List.generate(5, (i) => List.filled(5, '', growable: false)),
        index = 0;

    for (var i = 0; i < key.length; i++) {
      if (table.contains(key[i]) == false) {
        if (key[i] != 'j') table += key[i];
      }
    }

    for (var i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
      if (table.contains(String.fromCharCode(i)) == false &&
          String.fromCharCode(i) != 'j') table += String.fromCharCode(i);
    }

    for (var i = 0; i < 5; i++)
      for (var j = 0; j < 5; j++)
        matrix[i][j] = table[index++];

    for (var i = 0; i < text.length; i += 2) {
      late int row1, row2, col1, col2;
      for (var j = 0; j < 5; j++) {
        if (matrix[j].contains(text[i]) == true) {
          row1 = j;
          col1 = matrix[j].indexOf(text[i]);
        }
        if (matrix[j].contains(text[i + 1]) == true) {
          row2 = j;
          col2 = matrix[j].indexOf(text[i + 1]);
        }
      }
      if (row1 == row2) {
        resultp += matrix[row1][(col1 + 1) % 5];
        resultp += matrix[row2][(col2 + 1) % 5];
      } else if (col1 == col2) {
        resultp += matrix[(row1 + 1) % 5][col1];
        resultp += matrix[(row2 + 1) % 5][col2];
      } else {
        resultp += matrix[row1][col2];
        resultp += matrix[row2][col1];
      }
    }
    setState(() {
      result = resultp;
    });
    return result;
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
