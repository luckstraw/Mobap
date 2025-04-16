import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final CollectionReference _products = FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getProducts() {
    return _products.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList();
    });
  }
}
