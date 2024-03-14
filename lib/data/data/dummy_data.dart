import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';

class EcoDummyData {
  // -- Banners
  // static final List<BannerModel> banners = [
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner1,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner2,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner3,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner1,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner2,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner2,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: EcoImages.promoBanner3,
  //       targetScreen: EcoRoutes.order,
  //       active: false),
  // ];

  // -- User
  // static final UserModel user = UserModel(

  // );

  // -- Cart
  // static final CartModel cart = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantit
  //     )
  //   ]
  // )

  // -- Order
  // static final List<OrderModel> orders = [];

  // -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: EcoImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '5',
        image: EcoImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: EcoImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: EcoImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '4',
        image: EcoImages.animalIcon,
        name: 'Animals',
        isFeatured: true),
    CategoryModel(
        id: '6', image: EcoImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: EcoImages.cosmeticIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: EcoImages.jewelryIcon,
        name: 'Jewelery',
        isFeatured: true),

    // Subcategories
    CategoryModel(
        id: '8',
        image: EcoImages.sportIcon,
        name: 'Sports Shoes',
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        image: EcoImages.sportIcon,
        name: 'Track suits',
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        image: EcoImages.sportIcon,
        name: 'Sports Equipments',
        isFeatured: false,
        parentId: '1'),

    // Furniture
    CategoryModel(
        id: '11',
        image: EcoImages.furnitureIcon,
        name: 'Bedroom furniture',
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        image: EcoImages.furnitureIcon,
        name: 'Kitchen furniture',
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '13',
        image: EcoImages.furnitureIcon,
        name: 'Office furniture',
        isFeatured: false,
        parentId: '5'),

    // Electronics
    CategoryModel(
        id: '15',
        image: EcoImages.electronicsIcon,
        name: 'Laptop',
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '16',
        image: EcoImages.electronicsIcon,
        name: 'Mobile',
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '17',
        image: EcoImages.clothIcon,
        name: 'Shirts',
        isFeatured: false,
        parentId: '3'),
  ];
}
