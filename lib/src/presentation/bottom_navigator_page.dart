import 'package:buchi/src/presentation/home_page.dart';
import 'package:buchi/src/presentation/pets/pets_list_page.dart';
import 'package:flutter/material.dart';

class BottomNavigatorPage extends StatefulWidget {
  static const routeName = "/bottom_navigator_page";

  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const PetsPage(),
    //const SearchPage(),
    //const ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens.elementAt(currentIndex)),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    List<BottomNavigationBarItem> bottomBarItems = [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 32,
        ),
        label: "",
        activeIcon: Icon(
          Icons.home_filled,
          size: 40,
        ),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        label: "",
        activeIcon: Icon(
          Icons.search,
          size: 40,
        ),
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.location_on_outlined,
          size: 32,
        ),
        label: "",
        activeIcon: Icon(
          Icons.location_on_outlined,
          size: 40,
        ),
      ),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFFFAFAFA),
      currentIndex: currentIndex+1,
      selectedItemColor:  Color(0xFF2456B4),
      unselectedItemColor: Colors.black54,
      iconSize: 24,
      unselectedLabelStyle:
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      selectedLabelStyle:
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      onTap: (index) => setState(() => currentIndex = index),
      items: bottomBarItems,
    );
  }
}
