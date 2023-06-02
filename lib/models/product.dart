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
      id: json['id'],
      imageUrl: json["imageUrl"],
      name: json['name'],
      category: json["category"],
      discount: json['discount'],
      price: json["price"],
      rating: json['rating'],
      reviews: json['reviews'],
      section: json['section']

    );

  }

}