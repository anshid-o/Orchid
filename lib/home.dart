import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_app/constants/colors.dart';
// import 'package:model_app/constants/const.dart';
import 'package:model_app/pages/arrivals_page.dart';
import 'package:model_app/pages/home_page.dart';
import 'package:model_app/pages/profile_page.dart';
import 'package:model_app/pages/temp_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orchid Furniture', //Orchid Furniture
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: col1(context),
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       box(x: size.height * .05),
      //       const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text(
      //           'Welcome',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       ExpansionTile(
      //         title: InkWell(
      //           child: const Text('About'),
      //           onDoubleTap: () async {
      //             // FirebaseFirestore.instance.collection('Data').add({'num': 5});
      //           },
      //         ),
      //         leading: const Icon(Icons.info),
      //         children: const [
      //           Text(
      //               'Description about app.Amet ea quis nostrud labore ipsum. Adipisicing anim pariatur sunt velit cillum sint adipisicing non commodo pariatur pariatur nulla. Nisi irure laboris ipsum nostrud nostrud laboris. Nulla est est enim id est est cupidatat culpa labore aliqua..')
      //         ],
      //       ),
      //       box(x: size.height * .03),
      //       const ExpansionTile(
      //         title: Text('Help'),
      //         leading: Icon(Icons.help),
      //         children: [
      //           Text(
      //               'Description about app.Gyjyd ughurh rjjrwbg wgwg.Gyjyd ughurh rjjrwbg wgwg.Gyjyd ughurh rjjrwbg wgwg.')
      //         ],
      //       ),
      //       box(x: size.height * .03),
      //       const ExpansionTile(
      //         title: Text('Contact Us'),
      //         leading: Icon(Icons.contacts_sharp),
      //         children: [
      //           Text(
      //               'Description about app.Gyjyd ughurh rjjrwbg wgwg.Gyjyd ughurh rjjrwbg wgwg.Gyjyd ughurh rjjrwbg wgwg.')
      //         ],
      //       ),
      //       box(x: size.height * .03),
      //     ],
      //   ),
      // ),
      backgroundColor: col1(context),
      body: buildPages(),
      bottomNavigationBar: buidbottomNavBAr(),
    );
  }

  Widget buidbottomNavBAr() {
    return BottomNavyBar(
      itemCornerRadius: 20,
      containerHeight: 65,
      backgroundColor: color1,
      selectedIndex: index,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          activeColor: kc10,
          textAlign: TextAlign.center,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
        ),
        BottomNavyBarItem(
          activeColor: kc10,
          textAlign: TextAlign.center,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Icons.new_releases_outlined,
          ),
          title: const Text('Latest'),
        ),
        BottomNavyBarItem(
          activeColor: Colors.teal,
          textAlign: TextAlign.center,
          inactiveColor: Colors.grey,
          icon: const Icon(Icons.local_offer_outlined),
          title: const Text('Offer'),
        ),
        BottomNavyBarItem(
          activeColor: kc10,
          textAlign: TextAlign.center,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Icons.upcoming_outlined,
          ),
          title: const Text('Upcoming'),
        ),
        BottomNavyBarItem(
          activeColor: Colors.grey,
          textAlign: TextAlign.center,
          inactiveColor: Colors.grey,
          icon: const Icon(
            CupertinoIcons.profile_circled,
            size: 30,
          ),
          title: const Text('Profile'),
        ),
      ],
      onItemSelected: (index) {
        if (mounted) {
          setState(() {
            this.index = index;
          });
        }
      },
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return const ArrivalsPage();
      case 2:
        return HomePage();
      case 3:
        return const ArrivalsPage();
      case 4:
        return ProfilePage();

      case 0:
        return const HomePage();
      default:
        return TempPage(str: 'Home Page');
    }
  }
}
