import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/pages/home/product_page2.dart';
import 'package:model_app/product_page.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.size, required this.doc});

  final Size size;
  QueryDocumentSnapshot<Map<String, dynamic>> doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * .03),
                    Container(
                      width: size.width * .3,
                      height: size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: col1(context),
                        image: DecorationImage(
                          image: NetworkImage(doc['image_url']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 10),
                        child: SizedBox(
                          width: size.width * .5,
                          child: Text(
                            doc['product_name'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: size.width * .03),
                      Container(
                        width: size.width * .35,
                        child: Text(
                          'Rs. ${doc['product_price']} /unit',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * .015),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .03,
                      ),
                      Container(
                        width: size.width * .2,
                        height: size.width * .06,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 206, 148, 126),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.star_sharp,
                              size: 12,
                              color: Colors.yellow,
                            ),
                            Expanded(
                              child: Text(
                                doc['rating'].toString(),
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * .09,
                      ),
                      // Container(
                      //   width: size.width * .2,
                      //   height: size.width * .06,
                      //   decoration: BoxDecoration(
                      //       color: Colors.green,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: const Center(
                      //     child: Text(
                      //       'Retail',
                      //       style: TextStyle(
                      //           fontSize: 15, fontWeight: FontWeight.w400),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: size.width * .015),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage2(
                                        doc: doc,
                                      )));
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Show Product',
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: size.width * .03),
                      // OutlinedButton(
                      //     onPressed: () {
                      //       showDialog(
                      //         context: context,
                      //         builder: (context) {
                      //           return AlertDialog(
                      //             title: Text("Confirm Delete"),
                      //             content: Text(
                      //                 "Product deletion will automatically cancel all the existing orders of the product"),
                      //             actions: [
                      //               TextButton(
                      //                 child: Text("CANCEL"),
                      //                 onPressed: () {
                      //                   Navigator.of(context).pop();
                      //                 },
                      //               ),
                      //               TextButton(
                      //                 child: Text("OK"),
                      //                 onPressed: () {
                      //                   //  deactivateProductAndCancelOrders(passingdocument.id);
                      //                   Navigator.of(context).pop();
                      //                 },
                      //               ),
                      //             ],
                      //           );
                      //         },
                      //       );
                      //     },
                      //     style: OutlinedButton.styleFrom(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(50))),
                      //     child: const Icon(
                      //       Icons.delete,
                      //       color: Colors.red,
                      //     ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
