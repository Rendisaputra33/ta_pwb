import 'package:flutter/material.dart';
import 'package:musix_app/provider/nav_provider.dart';
import 'package:musix_app/views/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final provider = Provider.of<NavProvider>(context);

    //
    return Scaffold(
      bottomNavigationBar: BottomMenu(provider: provider),
      body: menu.elementAt(provider.index),
    );
  }
}
