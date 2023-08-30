import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/add_product.dart';
import 'package:model_app/pages/product_card.dart';
import 'package:model_app/pages/product_page2.dart';
import 'package:model_app/pages/add_product2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'images/logo.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () async {},
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (ctx) => Add()));
                  },
                  style: ButtonStyle(
                    // elevation: MaterialStateProperty.all(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
            box(x: 40),
            MyListTile(
              tit: 'Add a product',
              icon: Icons.add_shopping_cart_rounded,
            ),
            MyListTile(
              tit: 'Remove a product',
              icon: Icons.remove_shopping_cart_outlined,
            ),
            MyListTile(
              tit: 'Edit a product',
              icon: Icons.update_rounded,
            )
          ],
        ),
      ),
    ));
  }
}

class MyListTile extends StatelessWidget {
  MyListTile(
      {super.key, required this.icon, required this.tit, this.index = 0});
  String tit;
  IconData icon;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const AddProduct2()));
          }
        },
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            size: 26,
          ),
        ),
        title: Text(
          tit,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
