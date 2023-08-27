import 'package:flutter/material.dart';
import 'package:model_app/product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children:
            List.generate(20, (index) => myItem(index: index + 1, size: size)),
      ),
    ));
  }
}

class myItem extends StatelessWidget {
  const myItem({
    super.key,
    required this.index,
    this.isNew = false,
    required this.size,
  });
  final int index;
  final bool isNew;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                    index: index,
                  ))),
      child: Container(
        height: size.height * .215,
        width: size.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: [
              Icon(
                Icons.image,
                size: isNew ? 300 : 120,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  children: [
                    Text('Product $index'),
                    Text('Price $index'),
                    Text('Rating $index *****'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
