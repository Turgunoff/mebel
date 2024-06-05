import 'package:carousel_slider/carousel_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../data/models/category_model.dart';

class HomeController extends GetxController {
  final _carouselIndex = 0.obs; // Observable variable for current index
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final categories = <Category>[].obs;
  final isLoading = false.obs; // isLoading o'zgaruvchisi

  @override
  void onInit() {
    super.onInit();
    fetchPopularCategories();
  }

  Future<void> fetchPopularCategories() async {
    isLoading.value = true;
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

  int get carouselIndex => _carouselIndex.value;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    _carouselIndex.value = index; // Update the index when the page changes
  }
}
