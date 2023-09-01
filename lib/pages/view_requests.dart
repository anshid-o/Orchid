import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/pages/request_page.dart';
// import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_card.dart';

class ViewRequests extends StatefulWidget {
  const ViewRequests({super.key});

  @override
  State<ViewRequests> createState() => _ViewRequestsState();
}

class _ViewRequestsState extends State<ViewRequests> {
  Stream<QuerySnapshot<Object?>>? stream;
  // final curruser = FirebaseAuth.instance.currentUser;
  String? cat = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (cat == '') {
      stream = FirebaseFirestore.instance
          .collection("Requests")
          .where("status", isEqualTo: 'active')
          .snapshots();
    } else {
      stream = FirebaseFirestore.instance
          .collection("Requests")
          .where('category', isEqualTo: cat)
          .where("status", isEqualTo: 'active')
          .snapshots();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Requests', //Orchid Furniture
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: col1(context),
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
                                Timestamp ts = document['upload_time'];
                                DateTime dt =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        ts.millisecondsSinceEpoch);

                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: size.width * .03),
                                              document['image_url'] != ''
                                                  ? Container(
                                                      width: size.width * .3,
                                                      height: size.width * .3,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: col1(context),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              document[
                                                                  'image_url']),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: size.width * .3,
                                                      height: size.width * .3,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: col1(context)),
                                                      child: Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        size: 50,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0, left: 10),
                                                  child: SizedBox(
                                                    width: size.width * .5,
                                                    child: Text(
                                                      document['product_name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: size.width * .02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0, left: 10),
                                                  child: SizedBox(
                                                    width: size.width * .5,
                                                    child: Text(
                                                      '${dt.year}/${dt.month}/${dt.day}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * .03),
                                              ],
                                            ),
                                            SizedBox(height: size.width * .015),
                                            SizedBox(height: size.width * .015),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .lightBlue),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Card(
                                                        elevation: 1,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Product Description',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                  '${document['description']}'),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                      //                   ExpansionTile(
                                                      //                        title: const Text('Product Discription'),
                                                      //                       children: [
                                                      //             Padding(
                                                      //               padding: const EdgeInsets.all(8.0),
                                                      //               child: Column(
                                                      //                 children: const [

                                                      //                     Text('''
                                                      // Awesome Designers provide high quality stitching threads at a lower price,
                                                      // the product bundle consists the folowing :-
                                                      // - 5 different colours of threads
                                                      // - Colors provided are Red,Blue,Yellow,White,Black
                                                      // Suitble for crochet designing
                                                      // Free Delivery Provided for Awesome Designer products

                                                      // '''),

                                                      //                 ],
                                                      //               ),
                                                      //             ),
                                                      //                       ],
                                                      //                   ),
                                                      ),
                                                ),
                                                SizedBox(
                                                    width: size.width * .03),
                                                OutlinedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Confirm Delete"),
                                                            content: Text(
                                                                "Product deletion will automatically cancel all the existing orders of the product"),
                                                            actions: [
                                                              TextButton(
                                                                child: Text(
                                                                    "CANCEL"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              TextButton(
                                                                child:
                                                                    Text("OK"),
                                                                onPressed: () {
                                                                  deactivateProductAndCancelOrders(
                                                                      document
                                                                          .id);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50))),
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
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

Future<void> deactivateProductAndCancelOrders(String productId) async {
  final productRef =
      FirebaseFirestore.instance.collection("Requests").doc(productId);

  final batch = FirebaseFirestore.instance.batch();

  batch.update(productRef, {"status": "inactive"});

  await batch.commit();
}
