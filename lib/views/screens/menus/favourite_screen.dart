import 'package:flutter/material.dart';
import 'package:musix_app/utils/Size.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF4D0099),
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
      body: Container(
        color: const Color(0xFF4D0099),
        child: Column(
          children: [
            Container(
              color: const Color(0xFF4D0099),
              margin: const EdgeInsets.only(left: 20, top: 25, bottom: 20),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 15),
                color: const Color(0xFF4D0099),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
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
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 18),
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
                                  left: SizeUtil.width(context) * 32 / 100,
                                  bottom: 0),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
