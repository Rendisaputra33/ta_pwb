import 'package:flutter/material.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_outlined),
            label: "Time",
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: SizeUtil.width(context),
        height: SizeUtil.height(context),
        child: Center(
          child: Column(
            children: [
              const Text('home'),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.googleLogout();
                  await FirebaseClient.auth.signOut();
                },
                child: const Text('signout'),
              ),
              Text(authProvider.user.email!)
            ],
          ),
        ),
      ),
    );
  }
}
