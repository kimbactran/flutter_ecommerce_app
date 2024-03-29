import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return result;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when load brand. Please try again';
    }
  }

  // Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();
      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['BrandId'] as String)
          .toList();
      final brandQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when load brand. Please try again';
    }
  }
}
