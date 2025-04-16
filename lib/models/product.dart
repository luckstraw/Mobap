class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({required this.id, required this.name, required this.imageUrl, required this.description, required this.price});

  factory Product.fromMap(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      name: data['name'],
      imageUrl: data['imageUrl'],
      description: data['description'],
      price: (data['price'] as num).toDouble(),
    );
  }
}
