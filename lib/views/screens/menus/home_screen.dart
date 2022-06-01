import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/utils/Redirect.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/views/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () async {
            await FirebaseClient.auth.signOut();
            await provider.googleLogout();
            Redirect.switchTo(context, '/start', replace: true);
          },
          child: const Icon(
            Icons.logout,
            color: Color(0xFF4D0099),
          ),
        ),
        title: const Text(
          'Grf4music',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi ' + provider.user.displayName!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 27,
                color: Color.fromARGB(209, 87, 87, 87),
              ),
            ),
            const Text(
              'Find the best songs of 2022',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: Color.fromARGB(85, 87, 87, 87),
              ),
            ),
            const SizedBox(height: 25),
            const CustomInputSearch(
              hint: 'Search for a song',
            ),
            const SizedBox(height: 30),
            const Text(
              'Latest Musics',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(157, 35, 35, 35),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://i.scdn.co/image/ab67616d0000b27391079d7ff840d5273aa2957d',
                            width: 190,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Seperti Kemarin',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://i.ytimg.com/vi/8uy7G2JXVSA/maxresdefault.jpg',
                            width: 190,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Weird Genius : Lathi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://m.media-amazon.com/images/I/91kVs2iDqZL._SS500_.jpg',
                            width: 190,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Sweet Scar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://images.genius.com/9d265a0e8aa85935c64d23fbb95cafc2.1000x1000x1.png',
                            width: 190,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Thats Hilarious',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'All Musics',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(157, 35, 35, 35),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 0,
                  top: 5,
                  bottom: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 90,
                // width: 358,
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        'https://i.scdn.co/image/ab67616d0000b27391079d7ff840d5273aa2957d',
                        width: 45,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Seperti Kemarin',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Noah',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.width(context) * 22 / 100, bottom: 0),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 0,
                  top: 5,
                  bottom: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 90,
                // width: 358,
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        'https://i.ytimg.com/vi/8uy7G2JXVSA/maxresdefault.jpg',
                        width: 45,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Lathi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Weird Genius',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.width(context) * 40 / 100, bottom: 0),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 0,
                  top: 5,
                  bottom: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 90,
                // width: 358,
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        'https://m.media-amazon.com/images/I/91kVs2iDqZL._SS500_.jpg',
                        height: 28,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sweet Scar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Weird Genius',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.width(context) * 35 / 100, bottom: 0),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
