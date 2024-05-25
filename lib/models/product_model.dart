class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final Map<String, dynamic> rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        rating: jsonData['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
