import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/chicken.jpeg'),
            ),
            SizedBox(height: 5),
            Text("Category ${index + 1}"),
          ],
        );
      },
    );
  }
}
