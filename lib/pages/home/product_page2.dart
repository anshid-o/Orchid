import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductPage2 extends StatefulWidget {
  ProductPage2({super.key, required this.doc});
  QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  State<ProductPage2> createState() => _ProductPage2State();
}

int minQuantity = 1;

class _ProductPage2State extends State<ProductPage2> {
  void decrement() {
    setState(() {
      if (minQuantity > int.parse(widget.doc['min_quantity'])) {
        minQuantity--;
      }
    });
  }

  void increment() {
    setState(() {
      if (minQuantity < int.parse(widget.doc['max_quantity'])) {
        minQuantity++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App name'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image Product
                    AspectRatio(
                      aspectRatio: 3 / 3,
                      child: Image.network(
                        widget.doc['image_url'],
                        fit: BoxFit.cover,
                      ),
                    ),

                    //Product Hero
                    Row(
                      children: [
                        //ProductName
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: size.width * .5,
                                  child: Text(
                                    widget.doc['product_name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ],
                          ),
                        ),
                        Spacer(),
                        //Price
                        Column(
                          children: [
                            Text(
                              'Rs.${widget.doc['product_price']}/-',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            //rating row
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(widget.doc['rating'].toString()),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    //Product Desc
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Product Description',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  // sizedBox,
                                  Text(widget.doc['description']),
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
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * .4,
              height: size.width * .12,
              child: ElevatedButton(
                  onPressed: () async {
                    final phoneNumber = '+919048011615';
                    final url = Uri(scheme: 'tel', host: phoneNumber);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: col1(context),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.call,
                        size: 20,
                      ),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.width * .2,
            decoration: BoxDecoration(
              color: col1(context),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      decrement();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(minQuantity.toString(),
                        style: const TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      increment();
                    }, //increment,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Icon(
                      // LineAwesomeIcons.plus,
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width * .4,
                    height: size.width * .12,
                    child: ElevatedButton(
                        onPressed: () {
                          // final firestore = FirebaseFirestore.instance;
                          // final user= FirebaseAuth.instance.currentUser;
                          // num totalprice = widget.minQuantity *widget.passingdocument['product_price'];

                          // firestore.collection('Orders').doc().set({
                          //     'customer_id':user?.uid,
                          //     'seller_id':widget.passingdocument['product_seller_id'],
                          //     'product_id':widget.passingdocument.id,
                          //     'datetime':DateTime.now(),
                          //     'status':'p',
                          //     'quantity':widget.minQuantity,
                          //     'totalprice': totalprice
                          // });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: NewSnackbar(
                                errortext:
                                    'You can Order $minQuantity from shop\nTotal Price : ${widget.doc['product_price'] * minQuantity}\nContact No: 9048011615',
                                errorcolor: Color.fromARGB(255, 248, 159, 127),
                              ),
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Check Price',
                          // style: TextStyle(color: textColor),
                        )),
                  ),
                ],
              ),
            ),
          )

          // Container(
          //   width: size.width * .9,
          //   height: size.width * .15,
          //   child: Container(
          //     width: size.width * .8,
          //     height: size.width * .2,
          //     // decoration: const BoxDecoration(
          //     //   color: Colors.lightBlue,
          //     // ),
          //     child: ElevatedButton(
          //         onPressed: () {
          //           // Navigator.push(context, MaterialPageRoute(
          //           //   builder: (context) => EditProductForm(
          //           //     productId: passingdocument.id,
          //           //   ),
          //           // ));
          //         },
          //         style: ElevatedButton.styleFrom(
          //             backgroundColor: Colors.amber.shade700,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(50))),
          //         child: const Text(
          //           'Edit Product',
          //           // style: TextStyle(color: textColor),
          //         )),
          //   ),
        ],
      ),
    );
  }
}

class NewSnackbar extends StatelessWidget {
  const NewSnackbar({
    Key? key,
    required this.errortext,
    required this.errorcolor,
  }) : super(key: key);

  final String errortext;
  final Color errorcolor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * .15,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: errorcolor),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      errortext.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // const Spacer(),
                    // Text(
                    //   errortext,
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.white,
                    //   ),
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -20,
            left: -20,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                        ),
                        Icon(
                          Icons.cancel,
                          color: errorcolor,
                          size: 30,
                        ),
                      ],
                    )))),
      ],
    );
  }
}
