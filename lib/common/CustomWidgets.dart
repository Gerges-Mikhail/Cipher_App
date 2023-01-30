import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color color;

  CommonText({
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color, required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,fontWeight: fontWeight,color: color,fontFamily: fontFamily),);
  }
}
showAlertDialog(BuildContext context) {
  List alphabets = [['A = 0', 'B = 1 ', 'C = 2', 'D = 3'],
    ['E = 4', 'F = 5', 'G = 6', 'H = 7'],
    ['I = 8', 'J = 9', 'K = 10', 'L = 11'],
    ['M = 12', 'N = 13', 'O = 14', 'P = 15'],
    ['Q = 16', 'R = 17', 'S = 18', 'T = 19'],
    ['U = 20', 'V = 21', 'W = 22', 'X = 23'],
    ['Y = 24', 'Z = 25']];

  Alignment cellalignment = Alignment.center;
  AlertDialog alert = AlertDialog(
    title: Text("English Alphabet with index"),
    actions: [
      InkWell(onTap: (){
        Navigator.pop(context);
      },
          child: Text("ok")),
    ],
    content: Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
        ),
          // gradient: LinearGradient(
          //     colors: [
          //       Color(0xFF58FFB7),
          //       Color(0xFF058292),
          //     ]),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[0][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[1][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 60,
                        decoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[2][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 60,
                        decoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[3][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 60,
                        decoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[4][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[0].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 40,
                        alignment: cellalignment,
                        width: 75,
                        decoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xFFE3FFF6),
                          //     Color(0xFF7FD5B2),
                          //   ],
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          alphabets[5][index],
                          style: TextStyle(fontSize: 10),
                          textScaleFactor:1.5,
                        )),
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(alphabets[6].length, (index) {
                return Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          alignment: cellalignment,
                          width: 60,
                          decoration:  BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xFFE3FFF6),
                            //     Color(0xFF7FD5B2),
                            //   ],
                            // ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Text(
                            alphabets[6][index],
                            style: TextStyle(fontSize: 10),
                            textScaleFactor:1.5,
                          )),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
void nextScreenReplace(context ,page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ) => page));
}
