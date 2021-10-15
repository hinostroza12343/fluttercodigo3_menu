import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_altoquepez/Services/firestore_service.dart';
import 'package:flutter_altoquepez/pages/customer/category_list_product_page.dart';
import 'package:flutter_altoquepez/pages/customer/product_detail_page.dart';
import 'package:flutter_altoquepez/widgets/category_filter_widget.dart';
import 'package:flutter_altoquepez/widgets/item_carousel_widget.dart';
import 'package:flutter_altoquepez/widgets/text_normal_widget.dart';

class HomeCustomerPage extends StatelessWidget {
  FirestoreService _categoriesFirestoreService =
      new FirestoreService(collection: 'categories');
  FirestoreService _productFirestoreService =
      new FirestoreService(collection: 'products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A21),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Header
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/logo.jpg"),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        H1(
                          text: "Central Palace",
                        ),
                        H2(
                          text: "Un sitio para tus mejores experiencias",
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Categories

              FutureBuilder(
                future: _categoriesFirestoreService.getCategories(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    List<Map<String, dynamic>> categories = snap.data;

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories
                              .map<Widget>(
                                (item) => CategoryFilterWidget(
                                  primary: item["order"],
                                  text: item["description"],
                                  goTo: CategoryListProductPage(),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              SizedBox(
                height: 20.0,
              ),
              //Promotions
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              // Section 1
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Entradas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Source Sans Pro Black'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              FutureBuilder(
                future: _productFirestoreService.getProductHome(
                    categoryId: "d5PafqZ9cC8otIdDCNeW"),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    List<Map<String, dynamic>> products = snap.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: products
                              .map<Widget>(
                                (e) => ItemCarouselWidget(
                                  image: e["image"],
                                  title: e["name"],
                                  subtitle: e["description"],
                                  price: e["precio"].toStringAsFixed(2),
                                  rate: e["rate"],
                                  goTo: ProductDetailPage(),
                                ),
                              )
                              .toList()),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              //Section 2

              SizedBox(
                height: 30.0,
              ),
              // Section 1
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Bebidas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Source Sans Pro Black'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                    ItemCarouselWidget(
                      image:
                          "https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg",
                      title: "Costillar de Cordero",
                      subtitle:
                          "Costillar de cordero con especias y acompañamiento de ensaladas.",
                      price: "50.00",
                      rate: "4.6",
                      discount: "50",
                      goTo: ProductDetailPage(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
