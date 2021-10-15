import 'package:flutter/material.dart';
import 'package:flutter_altoquepez/widgets/item_search_widget.dart';

class CategoryListProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A21),
      appBar: AppBar(
        title: Text(
          "Postres",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemSearchWidget(
                image:
                    "https://resizer.glanacion.com/resizer/wEfLMKxulijY62Dj0kjevpEPfJo=/768x0/filters:quality(80)/cloudfront-us-east-1.images.arcpublishing.com/lanacionar/5G4LZ5WTM5H4RHWT257DEGRZQU.jpg",
                title: "Torta de chocolate y nueces",
                subtitle: "Torta de chocolate y nueces con frutas de estación",
                rate: "4.5",
                price: "12.00",
                time: "2",
              ),
              ItemSearchWidget(
                image:
                    "https://resizer.glanacion.com/resizer/wEfLMKxulijY62Dj0kjevpEPfJo=/768x0/filters:quality(80)/cloudfront-us-east-1.images.arcpublishing.com/lanacionar/5G4LZ5WTM5H4RHWT257DEGRZQU.jpg",
                title: "Torta de chocolate y nueces",
                subtitle: "Torta de chocolate y nueces con frutas de estación",
                rate: "4.5",
                price: "12.00",
                time: "2",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
