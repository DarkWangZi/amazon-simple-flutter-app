// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:amazon/models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductCarousel({Key? key, required this.title, required this.products})
      : super(key: key);

  _buildProductCard(int index) {
    return Container(
      //! марджины и паддинги важны для таких отступов, margin - внешний отступ, padding - внутренний отступ
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: 150, //!
      decoration: const BoxDecoration(
        color: Color.fromARGB(198, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2, //? то, насколько он распространяется linearly
            blurRadius: 10, //? по радиусу распространение
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image(
              image: AssetImage(products[index].imageUrl),
              height: 100,
              width: 150, //!
            ),
          ),
          const SizedBox(height: 8),
          Text(
            products[index].name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$ ${products[index].price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                TextButton(
                  //! при редактировании TextButton писать стоит styleFrom
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () => print('Add to cart'),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(index);
            },
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
          ),
        )
      ],
    );
  }
}
