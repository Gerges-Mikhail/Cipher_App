import 'package:cs_project/common/CustomWidgets.dart';
import 'package:cs_project/screens/caesar/CaesarFormText.dart';
import 'package:cs_project/screens/caesar/CaesarFile.dart';
import 'package:cs_project/screens/home/home.dart';
import 'package:flutter/material.dart';

class CaesarHome extends StatefulWidget {
  const CaesarHome({Key? key}) : super(key: key);

  @override
  State<CaesarHome> createState() => _CaesarHomeState();
}

class _CaesarHomeState extends State<CaesarHome> {
  DateTime lastTimeBackbuttonWasClicked = DateTime.now();

  int currentindex = 0 ;
  bool pop = false;
  List<Widget> screens = [
    CaesarFormText(),
    CaesarFile(),
  ];
  List<String>titles=[
    'C a e s a r - Text Form',
    'C a e s a r - Text File',
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () async {
        return false;
    },
      child: Scaffold(
       resizeToAvoidBottomInset: false,
       appBar:  AppBar(
           backgroundColor: Colors.blue.withOpacity(.5),
           elevation: 10,
           title:  Text(titles[currentindex],style: TextStyle(fontSize: 18,color: Colors.white),),
           centerTitle: true,
           leading: IconButton(
               onPressed: () {
                 nextScreenReplace(context, const Home());
               },
               icon: const Icon(
                 Icons.arrow_back_ios,
                 color: Colors.white,
               )
                 ),
       ),
       body:screens[currentindex],
       bottomNavigationBar: BottomNavigationBar(
         selectedItemColor:Colors.blue,
         backgroundColor: Colors.white,
         type: BottomNavigationBarType.shifting,
         currentIndex: currentindex,
         onTap: (index){
           setState((){
             currentindex = index;
           });
         },
         items: [
           BottomNavigationBarItem(
             icon: Image.asset("assets/textform.png",height: 20,),
             label: 'Text Form',
           ),
           BottomNavigationBarItem(
             icon: Image.asset("assets/textfile.png",height: 20,),
             label: 'File',
           ),

         ],
       ) ,
        ),
    );
  }

}
