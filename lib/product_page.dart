import 'package:flutter/material.dart';

import 'constants/colors.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product $index'),
        backgroundColor: col1(context),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              Icons.image,
              size: 300,
            ),
            Text(
                'Excepteur proident nulla deserunt consectetur sit. Ut cillum tempor cupidatat ex sit qui amet elit commodo amet sint. Consequat elit consequat quis exercitation laborum veniam. Irure pariatur voluptate sint elit adipisicing minim fugiat exercitation laborum tempor aute ipsum. Labore labore incididunt non nulla Lorem velit occaecat veniam anim exercitation ex ea.')
          ],
        ),
      ),
    );
  }
}
