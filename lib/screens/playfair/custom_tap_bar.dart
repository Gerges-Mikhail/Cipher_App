import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {

  final int index;

  const CustomTabBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.blue),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomTabBarButton(
              text: "P l a y F a i r - Text Form",
              textColor: index == 0 ?Colors.white:Colors.brown,
              borderColor: index == 0 ? Colors.white : Colors.transparent,
              borderWidth: 3,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: "P l a y F a i r - Text File",
              textColor: index == 1 ?Colors.white:Colors.brown,
              borderColor: index == 1 ? Colors.white : Colors.transparent,
              borderWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton(
      {super.key,
        required this.text,
        required this.borderColor,
        required this.textColor,
        required this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
