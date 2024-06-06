import 'package:carousel_slider/carousel_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel/app/data/models/product_model.dart';

import '../../data/models/category_model.dart';

class HomeController extends GetxController {
  final _carouselIndex = 0.obs; // Observable variable for current index
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final categories = <Category>[].obs;
  final _products = <Product>[].obs; // Mahsulotlar uchun RxList

  final isLoading = true.obs; // isLoading o'zgaruvchisi

  @override
  void onInit() {
    super.onInit();
    fetchPopularCategories();
    fetchPopularProducts();
  }

  Future<void> fetchPopularCategories() async {
    try {
      final snapshot = await _firestore
          .collection('Category')
          .orderBy('order', descending: false)
          .limit(4)
          .get();

      categories.value =
          snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPopularProducts() async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .where('discount', isGreaterThan: 0) // Faqat chegirmali mahsulotlar
          .orderBy('discount',
              descending: true) // Chegirma bo'yicha kamayish tartibida
          .get();

      _products.value =
          snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<Product> get products => _products.toList(); // products getter'i

  int get carouselIndex => _carouselIndex.value;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    _carouselIndex.value = index; // Update the index when the page changes
  }
}
