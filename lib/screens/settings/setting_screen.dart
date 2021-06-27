import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 240,
        decoration: BoxDecoration(color: Colors.purple),
        child: Text("Setting Screen"),
      ),
    );
  }
}
