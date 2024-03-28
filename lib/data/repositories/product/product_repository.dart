import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      final message = e.toString();
      print(message);
      throw 'Something went wrong when load products. Please try again.';
    }
  }

  // Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      final message = e.toString();
      print(message);
      throw 'Something went wrong. Please try again.';
    }
  }

  // Get products based on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      final message = e.toString();
      print(message);
      throw 'Something went wrong when load products. Please try again.';
    }
  }

  // Upload dummy data to the cloud Firebase
  // Feture<void> uploadDummyData(List<ProductModel> products) async {}
}
