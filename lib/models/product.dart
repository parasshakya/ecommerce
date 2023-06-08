class Product {

  final num id;
  final num discount;
  final num rating;
  final String category;
  final String name;
  final String imageUrl;
  final List<String> reviews;
  final num price;
  final String section;
  final String size;
  final String subCategory;
  final String brand;
  final String color;
  final num? priceAfterDiscount;

  Product(
      {this.priceAfterDiscount,required this.color, required this.brand, required this.subCategory, required this.size, required this.section, required this.id, required this.name, required this.imageUrl, required this.category, required this.discount, required this.price, required this.rating, required this.reviews});

  factory Product.fromJson(Map<String, dynamic> json){

    return Product(
      id: json['id'] as num  ,
      imageUrl: json["imageUrl"] as String,
      name: json['name'] as String,
      category: json["category"] as String,
      discount: json['discount'] as num,
      price: json["price"]   as num,
      rating: json['rating']  as num ,
      reviews: List<String>.from(json['reviews'] as List<dynamic>),
      section: json['section'] as String,
      size: json['size'] as String ,
      subCategory:  json['subCategory'] as String  ,
      brand: json['brand']  as String ,
      color: json['color'] as String,
      priceAfterDiscount: json['discount'] != 0 ? json['price'] - json['discount'] : json["price"]


    );

  }

}