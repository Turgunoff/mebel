import 'package:carousel_slider/carousel_options.dart'; // Slayder uchun kutubxona
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore ma'lumotlar bazasi bilan ishlash uchun kutubxona
import 'package:get/get.dart'; // GetX state menejmenti va boshqa qulayliklar uchun kutubxona
import 'package:get_storage/get_storage.dart'; // Lokal xotirada ma'lumotlarni saqlash uchun kutubxona
import 'package:mebel/app/data/models/product_model.dart'; // Mahsulot modeli

import '../../data/models/category_model.dart'; // Kategoriya modeli

class HomeController extends GetxController {
  // Bosh ekranni boshqaruvchi sinf
  final _carouselIndex =
      0.obs; // Slayderning joriy indeksini kuzatuvchi o'zgaruvchi
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Firestore ma'lumotlar bazasiga ulanish
  final categories = <Category>[].obs; // Kategoriyalarni saqlovchi ro'yxat
  final _products = <Product>[].obs; // Mahsulotlarni saqlovchi ro'yxat
  final _favorites = <Product>[].obs; // Sevimli mahsulotlarni saqlovchi ro'yxat

  final isLoading = true.obs; // Ma'lumotlar yuklanishini kuzatuvchi o'zgaruvchi

  final box =
      GetStorage('favoritesBox'); // Sevimli mahsulotlar uchun GetStorage xotira

  List<Product> get favorites =>
      _favorites.toList(); // Sevimli mahsulotlarni olish

  @override
  void onInit() {
    // Controller yaratilganida chaqiriladigan funksiya
    super.onInit();
    _loadFavorites(); // Sevimlilarni xotiradan yuklash
    fetchPopularCategories(); // Ommabop kategoriyalarni yuklash
    fetchPopularProducts(); // Ommabop mahsulotlarni yuklash
  }

  Future<void> fetchPopularCategories() async {
    // Ommabop kategoriyalarni Firestore'dan yuklash
    try {
      final snapshot = await _firestore
          .collection('Category')
          .orderBy('order', descending: false)
          .limit(4) // Eng ko'p ko'rilgan 4 ta kategoriya
          .get();

      categories.value =
          snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
    } catch (e) {
      print('Kategoriyalarni yuklashda xatolik: $e');
    } finally {
      isLoading.value = false; // Yuklash tugashi haqida xabar berish
    }
  }

  Future<void> fetchPopularProducts() async {
    // Ommabop mahsulotlarni Firestore'dan yuklash
    try {
      final snapshot = await _firestore
          .collection('products')
          .where('discount', isGreaterThan: 0) // Faqat chegirmali mahsulotlar
          .orderBy('discount',
              descending:
                  true) // Chegirma foizi bo'yicha kamayish tartibida saralash
          .get();

      _products.value =
          snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print('Mahsulotlarni yuklashda xatolik: $e');
    } finally {
      isLoading.value = false; // Yuklash tugashi haqida xabar berish
    }
  }

  List<Product> get products =>
      _products.toList(); // Mahsulotlar ro'yxatini olish

  int get carouselIndex =>
      _carouselIndex.value; // Slayderning joriy indeksini olish

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    // Slayder indeksi o'zgarganda chaqiriladi
    _carouselIndex.value = index;
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      removeFavorite(product.id);
    } else {
      // Mahsulot ID sini GetStorage ga saqlash
      List<dynamic> favorites = box.read('favorites') ?? [];
      favorites.add(product.id);
      box.write('favorites', favorites);
      _favorites.add(product);
    }
    update();
  }

  void _loadFavorites() {
    _favorites.value = []; // Sevimlilar ro'yxatini tozalash

    // GetStorage'dan sevimlilarni o'qish
    List<dynamic>? favoritesData = box.read('favorites');

    if (favoritesData != null) {
      _favorites.value = favoritesData
          .map((productId) =>
              _getProductById(productId)) // Mahsulotni ID bo'yicha topish
          .whereType<Product>() // null bo'lgan qiymatlarni filtrlash
          .toList();
    }
  }

// Mahsulotni ID bo'yicha topadigan funksiya (agar kerak bo'lsa)
  Product? _getProductById(String productId) {
    return _products.firstWhereOrNull((product) => product.id == productId);
  }

  void removeFavorite(String productId) {
    // Sevimli mahsulotdan o'chirish
    box.remove(productId.toString());
    _favorites.removeWhere((p) => p.id == productId);
    update();
  }

  bool isFavorite(String productId) {
    // Mahsulot sevimlilar ro'yxatida bor/yo'qligini tekshirish
    return _favorites.any((p) => p.id == productId);
  }
}
