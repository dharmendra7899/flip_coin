import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final String sectionTitle;

  ProductList({required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            sectionTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('assets/images/mutton.png', height: 100),
                    Text("Product ${index + 1}"),
                    Text("₹${100 + index * 10}"),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
