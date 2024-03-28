import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      this.productCount});

  // Empty Helper function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  // Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  // Map Json oriented document snapshot from Firebase to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productCount: data['ProductCount'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false);
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return BrandModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          productCount: data['ProductCount'] ?? '',
          isFeatured: data['IsFeatured'] ?? false);
    } else {
      return BrandModel.empty();
    }
  }
}
