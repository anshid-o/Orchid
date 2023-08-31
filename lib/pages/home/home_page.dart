import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/home/product_card.dart';
import 'package:model_app/product_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.cat});

  final String cat;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: col1(context),
          centerTitle: true,
          title: Text(shop),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Products')
                .where('status', isEqualTo: 'active')
                .where('category', isEqualTo: cat)
                .orderBy('rating', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Lottie.asset('assets/lottie/fur_loading.json'),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.asset('assets/lottie/empty.json'),
                          Text(
                            'There is no $cat left',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}
