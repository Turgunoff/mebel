import 'package:carousel_slider/carousel_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../data/models/category_model.dart';

class HomeController extends GetxController {
  final _carouselIndex = 0.obs; // Observable variable for current index
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularCategories();
  }

  Future<void> fetchPopularCategories() async {
    try {
      final snapshot = await _firestore
          .collection('categories')
          .orderBy('order', descending: false) // O'sish tartibi
          .limit(6)
          .get();

      _categories.value =
          snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  int get carouselIndex => _carouselIndex.value;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    _carouselIndex.value = index; // Update the index when the page changes
  }
}
