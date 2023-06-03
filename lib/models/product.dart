class Product {

  final String id;
  final String discount;
  final String rating;
  final String category;
  final String name;
  final String imageUrl;
  final List<String> reviews;
  final String price;
  final String section;

  Product(
      {required this.section, required this.id, required this.name, required this.imageUrl, required this.category, required this.discount, required this.price, required this.rating, required this.reviews});

  factory Product.fromJson(Map<String, dynamic> json){

    return Product(
      id: json['id'] as String,
      imageUrl: json["imageUrl"] as String ,
      name: json['name'] as String,
      category: json["category"] as String,
      discount: json['discount'] as String,
      price: json["price"] as String ,
      rating: json['rating'] as String,
      reviews: List<String>.from(json['reviews'] as List<dynamic>),
      section: json['section'] as String

    );

  }

}