import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_app/pages/product_card.dart';
import 'package:model_app/product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Products')
                .where('status', isEqualTo: 'active')
                .orderBy('rating', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                default:
                  if (snapshot.data!.docs.isNotEmpty) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: List.generate(snapshot.data!.docs.length,
                              (index) {
                            final doc = snapshot.data!.docs[index];
                            return ProductCard(
                              size: size,
                              doc: doc,
                            );
                          }),
                        ));
                  } else {
                    return Center(
                      child: const Text(
                        'No Products',
                      ),
                    );
                  }
              }
            }));
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
              Container(
                height: size.height * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/c${index % 4}.jpg'))),
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
