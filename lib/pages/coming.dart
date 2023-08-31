import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';

class ComingPage extends StatelessWidget {
  const ComingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Orchid Furniture', //Orchid Furniture
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          backgroundColor: col1(context),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/lottie/shop.json'),
              Text(
                'Coming Soon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
