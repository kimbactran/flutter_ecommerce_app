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

  // Get products based on the query
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

  // Get Products based on the brand

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
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

  // // Get Products based on the category

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      // Extract productIds from the document
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['ProductId'] as String)
          .toList();
      // Query to get all documents where the productId is in the list of productsId
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
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
