import 'package:flutter/material.dart';

class SiginButton extends StatelessWidget {
  const SiginButton({super.key, required this.text, required this.onRoute});

  final String text;
  final Function onRoute;

  @override
  Widget build(BuildContext context) {
    // 구글. 페이스북, 애플 로고 작업?
    return InkWell(
      onTap: () => onRoute(),
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
