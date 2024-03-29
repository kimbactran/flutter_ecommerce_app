import 'dart:convert';

import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  // Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  Future<void> initFavorites() async {
    final json = EcoLocalStorage.instance().readData('favorites');

    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      EcoLoader.customToast(message: 'Product has been added to the Wishlist');
    } else {
      EcoLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      EcoLoader.customToast(
          message: 'Product has been remove from the Wishlist');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    EcoLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
