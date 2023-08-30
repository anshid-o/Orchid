import 'package:flutter/material.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/pages/product_page2.dart';

class AddProduct2 extends StatefulWidget {
  const AddProduct2({super.key});

  @override
  State<AddProduct2> createState() => _AddProduct2State();
}

class _AddProduct2State extends State<AddProduct2> {
  final _formKey = GlobalKey<FormState>();

  bool _isWholesale = false;

  late String _productName;

  late int _maxQuantity;

  late int _minQuantity;

  late int _productPrice;

  late String _productDesc;

  final kpname = TextEditingController();

  final kdesc = TextEditingController();

  final kprice = TextEditingController();

  final kminqty = TextEditingController();

  final kmaxqty = TextEditingController();

  final kselltype = TextEditingController();

  final kcat = TextEditingController();

  String? dropdownValue = '';

  late var imgTemp;

  final _imageController = TextEditingController();

  String? productImgUrl;

  File? image;

  UploadTask? uploadTask;

  Future pickimagefromgallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imgtemp = File(image.path);
      imgTemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('failed to pick image: $e ');
    }
  }

  Future pickusingcamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imgtemp = File(image.path);
      imgTemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('failed to pick image: $e ');
    }
  }

  Future<String> uploadImage(File image) async {
    // Generate a unique file name
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Create a reference to the file location in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child('images/$fileName');

    // Upload the file to Firebase Storage
    uploadTask = ref.putFile(image);

    final snapshot = await uploadTask!.whenComplete(() {});

    // Get the download URL for the file
    String downloadURL = await snapshot.ref.getDownloadURL();

    // Return the download URL
    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: col1(context),
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.image,
                          size: 100,
                        ),

                  // Lottie.asset('assets/lottie/product_img_lottie.json',
                  // height: 150),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: col1(context),
                          maximumSize: Size.fromWidth(300),
                        ),
                        onPressed: () {
                          pickusingcamera();
                        },
                        icon: const Icon(Icons.camera_alt_rounded),
                        label: const Text(
                          ' Capture Image ',
                          style: TextStyle(fontSize: 12),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: col1(context),
                          maximumSize: Size.fromWidth(300),
                        ),
                        onPressed: () {
                          pickimagefromgallery();
                        },
                        icon: const Icon(Icons.folder_copy_rounded),
                        label: const Text(
                          'Pick from Gallery',
                          style: TextStyle(fontSize: 12),
                        )),
                  ],
                ),
                TextFormField(
                  controller: kpname,
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name for the product';
                    }
                    return null;
                  },
                  onSaved: (value) => _productName = value!,
                ),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Select a Category';
                    }
                    return null;
                  },
                  value: dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: '',
                      child: Text('Select Category'),
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
                ),
                TextFormField(
                  controller: kdesc,
                  decoration: InputDecoration(labelText: 'Product Desciption'),
                  maxLines: 4,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a desciption for the product';
                    }
                    return null;
                  },
                  onSaved: (value) => _productDesc = value!,
                ),
                TextFormField(
                  controller: kprice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                  onSaved: (value) => _productPrice = int.parse(value!),
                ),
                TextFormField(
                  controller: kmaxqty,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Maximum Quantity to Order'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the maximum quantity';
                    } else if (int.parse(kmaxqty.text) <=
                        int.parse(kminqty.text)) {
                      return 'Maximum should be greater than Minimum';
                    }
                    return null;
                  },
                  onSaved: (value) => _maxQuantity = int.parse(value!),
                ),
                TextFormField(
                  controller: kminqty,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Minimum Quantity to Order'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the minimum quantity';
                    }
                    return null;
                  },
                  onSaved: (value) => _minQuantity = int.parse(value!),
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Retail",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18,
                //           color: Colors.red,
                //         )),
                //     Switch(
                //       activeColor: Colors.green,
                //       inactiveThumbColor: Colors.red,
                //       inactiveTrackColor: Colors.red.shade100,
                //       value: _isWholesale,
                //       onChanged: (value) {
                //         setState(() {
                //           _isWholesale = value;
                //         });
                //       },
                //     ),
                //     const Text("Wholesale",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18,
                //           color: Colors.green,
                //         ))
                //   ],
                // ),
                ElevatedButton(
                  onPressed: () async {
                    print(image);
                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: customsnackbar(
                            errortext: 'Please Select an Image !',
                            errorcolor: Colors.lightBlue,
                          ),
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        ),
                      );
                    } else {
                      if (_formKey.currentState!.validate()) {
                        final user = FirebaseAuth.instance.currentUser;
                        final db = FirebaseFirestore.instance;
                        final dl = await uploadImage(image!);
                        print('!!!!!!!!!!${dl}!!!!!!!!!!!');

                        db.collection("Products").doc().set({
                          'product_name': kpname.text,
                          'category': dropdownValue,
                          'description': kdesc.text,
                          'product_price': int.parse(kprice.text),
                          'min_quantity': kminqty.text,
                          'max_quantity': kmaxqty.text,
                          'image_url': dl,
                          'rating': 0.0,
                          'rating_count': 0,
                          'upload_time': DateTime.now(),
                          'status': 'active'
                        });

                        _formKey.currentState!.save();
                        Navigator.pop(context);

                        // Add logic to save the product here
                        // ...

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: NewSnackbar(
                              errortext: 'Product added successfully',
                              errorcolor: Colors.green,
                            ),
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class customsnackbar extends StatelessWidget {
  const customsnackbar({
    Key? key,
    required this.errortext,
    required this.errorcolor,
  }) : super(key: key);

  final String errortext;
  final Color errorcolor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: col1(context)),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Warning!'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const Spacer(),
                    Text(
                      errortext,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
