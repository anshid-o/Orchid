import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int currentStep = 0;

  List<String> works = [
    'Chair',
    'Bed',
    'Couch',
    'Wardrobe',
    'Table',
    'Desk',
    'Stool',
    'Shelf',
    'Drawer',
    'Other'
  ];

  String selectedItem = 'Chair';
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: col1(context),
      ),
      body: Center(
        child: Stepper(
          steps: [
            Step(
              isActive: currentStep == 0,
              title: const Text(
                'Select Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              content: Row(
                children: [
                  Container(
                    width: size.width * .6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 229, 229, 229)),
                    child: DropdownButtonFormField<String>(
                      // dropdownColor: ,
                      // iconSize: 20,
                      elevation: 8,
                      // autofocus: true,
                      decoration: InputDecoration(
                          fillColor: color1,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 2,
                              ))),
                      value: selectedItem,
                      items: works
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedItem = item!;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Step(
                isActive: currentStep == 1,
                title: const Text(
                  'Specify Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                content: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: desc,
                  decoration: const InputDecoration(
                      label: Text('Enter product details'),
                      icon: Icon(Icons.edit)),
                )
                // content: MyTextForm(
                //     textColor: Colors.black,
                //     kt: kexp,
                //     name: 'Experience',
                //     icon: Icons.group_work_outlined),
                ),
            Step(
                isActive: currentStep == 2,
                title: const Text(
                  'Insert Image',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                content: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: desc,
                  decoration: const InputDecoration(
                      label: Text('Enter product details'),
                      icon: Icon(Icons.edit)),
                )
                // content: MyTextForm(
                //     textColor: Colors.black,
                //     kt: kexp,
                //     name: 'Experience',
                //     icon: Icons.group_work_outlined),
                ),
            Step(
              isActive: currentStep == 3,
              title: const Text(
                'Specify Price',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              content: TextFormField(
                keyboardType: TextInputType.number,
                // controller: kdet,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  filled: true,
                  // fillColor: kc60.withOpacity(.2),
                  label: Text(
                    'Enter rate',
                    textAlign: TextAlign.start,
                  ),
                  prefixIcon: Icon(
                    Icons.price_change,
                    // color: kc10,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintStyle: TextStyle(color: Color.fromARGB(255, 54, 9, 62)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
          currentStep: currentStep,
          onStepTapped: (value) {
            setState(() {
              currentStep = value;
            });
          },
          onStepContinue: () {
            setState(() {
              currentStep++;
            });
            // if (currentStep == 0) {
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         backgroundColor: kc30,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0)),
            //         title: const Text(
            //           'Error',
            //           style: TextStyle(color: kc60),
            //         ),
            //         content: const Text('Please enter yor work !!!',
            //             style: TextStyle(color: kc60)),
            //       );
            //     });
            // } else
          },
          onStepCancel: () {
            if (currentStep != 0) {
              setState(() {
                currentStep -= 1;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
