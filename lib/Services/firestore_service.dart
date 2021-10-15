import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  String collection;

  FirestoreService({required this.collection});

  late CollectionReference _firestoreReferences =
      FirebaseFirestore.instance.collection(this.collection);

  Future<List<Map<String, dynamic>>> getCategories() async {
    List<Map<String, dynamic>> categories = [];
    QuerySnapshot _collectionReference =
        await _firestoreReferences.orderBy('order', descending: true).get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element) {
      Map<String, dynamic> categoryMap = element.data() as Map<String, dynamic>;
      categoryMap["id"] = element.id;
      categories.add(categoryMap);
    });
    return categories;
  }

  Future<List<Map<String, dynamic>>> getProductHome(
      {String? categoryId}) async {
    List<Map<String, dynamic>> products = [];
    QuerySnapshot _collectionReference = await _firestoreReferences
        .where('category', isEqualTo: categoryId)
        .get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element) {
      Map<String, dynamic> product = element.data() as Map<String, dynamic>;
      product["id"] = element.id;
      products.add(product);
    });
    return products;
  }
}
