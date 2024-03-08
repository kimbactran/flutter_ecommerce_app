// Repository class for user-related operations.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/authentication/modals/user_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to fetch user details based on user ID.

  // Function to update user data in Firestore.

  // Update any field in specific Users Collection.
}
