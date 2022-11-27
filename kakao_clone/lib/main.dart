import 'package:flutter/material.dart';
import 'package:kakao_clone/screen/kakao_home.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: KakaoHome(),
    );
  }
}
