import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_altoquepez/pages/customer/category_list_product_page.dart';
import 'package:flutter_altoquepez/pages/customer/home_customer_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Theme.of(context).accentColor,
          primarySwatch: Colors.blue,
          fontFamily: 'Source Sans Pro Regular'),
      home: HomeCustomerPage(),
    );
  }
}
