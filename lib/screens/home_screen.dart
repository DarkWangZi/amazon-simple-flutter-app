// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:amazon/models/product_model.dart';
import 'cart_screen.dart';
import 'package:amazon/widgets/product_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.green, Colors.lime, Colors.orange, Colors.pink],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     stops: [0.1, 0.3, 0.7, 1],
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkResponse(
              onTap: () => print('Menu'),
              child: const Icon(
                Icons.menu,
                size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
          title: const Image(
            image: AssetImage('assets/images/amazon_logo.jpg'),
            height: 30.0,
          ),
          centerTitle: true,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                  child: InkResponse(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CartScreen(),
                      ),
                    ),
                    child: const Icon(
                      Icons.shopping_basket,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 16.0,
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkResponse(
                onTap: () => print('Search'),
                child: const Icon(
                  Icons.search,
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  curve: Curves.ease,
                  child: Image(
                    image: AssetImage('assets/images/amazon_logo.jpg'),
                  ),
                ),
                Center(
                  child: Text(
                    'Spend less. Smile more! ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        wordSpacing: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/samsung_gear_vr.jpg'),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 30.0,
                  right: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'POPULAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'The future of',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'virtual reality',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 70.0,
                        width: double.infinity,
                        color: const Color.fromARGB(198, 255, 255, 255),
                        child: Row(
                          children: <Widget>[
                            const Image(
                              image: AssetImage('assets/images/gear_vr.jpg'),
                              height: 50.0,
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Samsung Gear VR',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'FOR GAMERS',
                                  style: TextStyle(
                                    color: Color.fromARGB(85, 6, 0, 0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 60.0,
                                    child: IconButton(
                                      onPressed: () => print('Go to product'),
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 30.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15.0),
            ProductCarousel(
              title: 'Amazon Prime Deals',
              products: products,
            ),
            ProductCarousel(
              title: 'Popular Books',
              products: books,
            ),
          ],
        ),
      ),
    );
  }
}
