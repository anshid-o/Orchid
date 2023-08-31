import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/profile/add_product2.dart';
import 'package:model_app/pages/profile/product_cardS.dart';
// import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_card.dart';

class SellerProductPage extends StatefulWidget {
  const SellerProductPage({super.key});

  @override
  State<SellerProductPage> createState() => _SellerProductPageState();
}

class _SellerProductPageState extends State<SellerProductPage> {
  Stream<QuerySnapshot<Object?>>? stream;
  // final curruser = FirebaseAuth.instance.currentUser;
  String? cat = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (cat == '') {
      stream = FirebaseFirestore.instance
          .collection("Products")
          .where("status", isEqualTo: 'active')
          .snapshots();
    } else {
      stream = FirebaseFirestore.instance
          .collection("Products")
          .where('category', isEqualTo: cat)
          .where("status", isEqualTo: 'active')
          .snapshots();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orchid Furniture', //Orchid Furniture
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: col1(context),
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: col1(context),
      //   foregroundColor: Colors.black,
      //   title: const Text(
      //     shop,
      //     style: TextStyle(
      //       fontSize: 27,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       iconSize: 35,
      //       onPressed: () {
      //         // Navigator.pushNamed(context, 'sellerprofile');
      //       },
      //       icon: const Icon(
      //         Icons.account_circle_outlined,
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 4,
                style: BorderStyle.solid,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => const AddProduct2()));
        },
        child: const Text("Add Product",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.green)),
      ),
      body: Column(
        children: [
          Container(
            color: col1(context),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    'Filters : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      // hint: const Text('Category'),
                      value: cat,
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text('All Category'),
                        ),
                        DropdownMenuItem(
                          value: 'Chair',
                          child: Text('Chair'),
                        ),
                        DropdownMenuItem(
                          value: 'Bed',
                          child: Text('Bed'),
                        ),
                        DropdownMenuItem(
                          value: 'Couch',
                          child: Text('Couch'),
                        ),
                        DropdownMenuItem(
                          value: 'Wardrobe',
                          child: Text('Wardrobe'),
                        ),
                        DropdownMenuItem(
                          value: 'Table',
                          child: Text('Table'),
                        ),
                        DropdownMenuItem(
                          value: 'Desk',
                          child: Text('Desk'),
                        ),
                        DropdownMenuItem(
                          value: 'Stool',
                          child: Text('Stool'),
                        ),
                        DropdownMenuItem(
                          value: 'Shelf',
                          child: Text('Shelf'),
                        ),
                        DropdownMenuItem(
                          value: 'Drawer',
                          child: Text('Drawer'),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other'),
                        )
                      ],
                      onChanged: (value) => setState(() {
                        cat = value;
                      }),
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.35,
                  //   margin: const EdgeInsets.only(left: 10),
                  //   child: DropdownButton<String>(
                  //     // hint: const Text('Category'),
                  //     items:const [
                  //       DropdownMenuItem(
                  //         child: Text('Any Price'),
                  //         value: '0',
                  //       ),
                  //       DropdownMenuItem(
                  //         child: Text('Less than \nRs.500'),
                  //         value: '500',
                  //       ),
                  //       DropdownMenuItem(
                  //         child: Text('Less than \nRs.1000'),
                  //         value: '1000',
                  //       ),
                  //       DropdownMenuItem(
                  //         child: Text('Greater than \nRs.1000'),
                  //         value: '1',
                  //       ),
                  //     ],
                  //     value: price.toString(),
                  //     onChanged: (value) => setState(() {
                  //       price = num.parse(value!);
                  //     }),
                  //   ),
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.35,
                  //   margin: const EdgeInsets.only(left: 10),
                  //   child: DropdownButton(
                  //     // hint: const Text('Sale Type'),
                  //     value: type,
                  //     items: [
                  //       DropdownMenuItem(
                  //         child: Text('Retail'),
                  //         value: 'r',
                  //       ),
                  //       DropdownMenuItem(
                  //         child: Text('Wholesale'),
                  //         value: 'w',
                  //       ),
                  //     ],
                  //     onChanged: (value) => setState(() {
                  //       type = value;
                  //     }),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder<QuerySnapshot>(
                  stream: stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemBuilder: (context, index) {
                                DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                return SellerProductCard(
                                  passingdocument: document,
                                );
                              });
                        } else {
                          return Center(
                            child: Lottie.asset('assets/lottie/empty.json',
                                width: size.width * .75),
                          );
                        }
                    }
                  },
                )),
          ),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 10, right: 10),
          //     child: GridView.count(
          //         crossAxisCount: 2,
          //         childAspectRatio: 3 / 4,
          //         mainAxisSpacing: 10,
          //         crossAxisSpacing: 10,
          //         children: List.generate(10, (index) {
          //           return InkWell(
          //             onTap: () => Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => ProductFullViewPage(
          //                   title: _productNameList[index],
          //                   imageUrl: _imageUrlList[index],
          //                 ),
          //               ),
          //             ),
          //             child: ProductTile(
          //               price: _productPriceList[index],
          //               productname: _productNameList[index],
          //               imageUrl: _imageUrlList[index],
          //             ),
          //           );
          //         },),),
          //   ),
          // ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 15),
        ),
      );
}
