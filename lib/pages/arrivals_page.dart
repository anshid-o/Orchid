import 'package:flutter/material.dart';
import 'package:model_app/pages/home_page.dart';

class ArrivalsPage extends StatelessWidget {
  const ArrivalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            20,
            (index) => myItem(
                  index: index + 1,
                  size: size,
                  isNew: true,
                )),
      ),
    ));
  }
}
