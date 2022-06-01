import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:musix_app/provider/nav_provider.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/menus/favourite_screen.dart';
import 'package:musix_app/views/screens/menus/home_screen.dart';
import 'package:musix_app/views/screens/menus/profile_screen.dart';

const menu = <Widget>[HomeScreen(), FavouriteScreen(), ProfileScreen()];

class BottomMenu extends StatelessWidget {
  final NavProvider? provider;

  const BottomMenu({Key? key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(AntDesign.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(AntDesign.hearto),
          label: "Favourite",
        ),
        BottomNavigationBarItem(
          icon: Icon(AntDesign.user),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        provider?.setIndex(index);
      },
      selectedItemColor: Pallete.primary,
      currentIndex: provider!.index,
    );
  }
}
