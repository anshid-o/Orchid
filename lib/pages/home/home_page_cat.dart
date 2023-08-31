import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:model_app/constants/colors.dart';
import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/home/home_page.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orchid Furniture', //Orchid Furniture
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: col1(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.height * .05,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Choose a category : 👇',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: size.height * .7,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                    works.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => HomePage(
                                            cat: works[index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 153, 44, 68)),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  index == 0
                                      ? const Icon(
                                          Icons.chair_alt,
                                          color: Colors.white24,
                                        )
                                      : index == 1
                                          ? const Icon(
                                              Icons.bed,
                                              color: Colors.white24,
                                            )
                                          : index == 2
                                              ? const Icon(
                                                  Icons.chair_rounded,
                                                  color: Colors.white24,
                                                )
                                              : index == 3
                                                  ? const Icon(
                                                      CupertinoIcons.table_fill,
                                                      color: Colors.white24,
                                                    )
                                                  : index == 4
                                                      ? const Icon(
                                                          CupertinoIcons.table,
                                                          color: Colors.white24,
                                                        )
                                                      : index == 5
                                                          ? const Icon(
                                                              Icons.desk,
                                                              color: Colors
                                                                  .white24,
                                                            )
                                                          : index == 6
                                                              ? const Icon(
                                                                  Icons
                                                                      .chair_alt_sharp,
                                                                  color: Colors
                                                                      .white24,
                                                                )
                                                              : index == 7
                                                                  ? const Icon(
                                                                      Icons
                                                                          .shelves,
                                                                      color: Colors
                                                                          .white24,
                                                                    )
                                                                  : index == 8
                                                                      ? const Icon(
                                                                          Icons
                                                                              .shelves,
                                                                          color:
                                                                              Colors.white24,
                                                                        )
                                                                      : Lottie
                                                                          .asset(
                                                                          'assets/lottie/fur2.json',
                                                                          height:
                                                                              size.height * .1,
                                                                          frameRate:
                                                                              FrameRate(20),
                                                                        ),
                                  Text(
                                    works[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
