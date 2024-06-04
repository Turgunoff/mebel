import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String name;
  final String image;
  final int order;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.order,
  });

  factory Category.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    return Category(
      id: doc.id,
      name: data['name'],
      image: data['image'],
      order: data['order'],
    );
  }
}
