import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final List<String> images;
  final int price;
  final int discount;
  final String description;
  final Map<String, dynamic> dimensions; // Balandlik, uzunlik va en
  final Map<String, dynamic>
      characteristics; // Rang, brend, material va boshqalar
  final int assemblyPrice;
  final String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.discount,
    required this.description,
    required this.dimensions,
    required this.characteristics,
    required this.assemblyPrice,
    required this.categoryId,
  });

  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Product(
      id: doc.id,
      name: data['name'],
      images: List<String>.from(data['images']),
      price: data['price'],
      discount: data['discount'],
      description: data['description'],
      dimensions: data['dimensions'],
      characteristics: data['characteristics'],
      assemblyPrice: data['assemblyPrice'],
      categoryId: data['categoryId'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      dimensions: json['dimensions'],
      characteristics: json['characteristics'],
      assemblyPrice: json['assemblyPrice'],
      categoryId: json['categoryId'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'images': images,
        'price': price,
        'discount': discount,
        'description': description,
        'dimensions': dimensions,
        'characteristics': characteristics,
        'assemblyPrice': assemblyPrice,
        'categoryId': categoryId
      };
}
