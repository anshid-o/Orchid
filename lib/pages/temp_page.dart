import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';

class TempPage extends StatelessWidget {
  String str;

  TempPage({super.key, required this.str});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(str)],
        ),
      ),
    );
  }
}
