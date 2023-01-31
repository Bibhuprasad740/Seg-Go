import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  void initState() {
    super.initState();
    GlobalVariables.firestoreController.addData();
  }

  int pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalVariables().screens[pageIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIdx = index;
          });
        },
        currentIndex: pageIdx,
        backgroundColor: GlobalVariables.backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.yellow.shade900,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.thermostat,
              size: 30,
            ),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 30,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
