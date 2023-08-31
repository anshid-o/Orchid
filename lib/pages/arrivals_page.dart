import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/home/home_page.dart';
import 'package:model_app/pages/home/product_card.dart';

class ArrivalsPage extends StatelessWidget {
  const ArrivalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: col1(context),
          centerTitle: true,
          title: const Text('Most recent items'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Products')
                .where('status', isEqualTo: 'active')
                .orderBy('upload_time', descending: true)
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
                          children: List.generate(
                              snapshot.data!.docs.length > 10
                                  ? 10
                                  : snapshot.data!.docs.length, (index) {
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
                            'There is no latest products',
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
