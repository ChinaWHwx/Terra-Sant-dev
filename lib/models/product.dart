class Product {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;
  String? price;

  Product(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.oldPrice,
      this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['imageUrl'] = imageUrl;
    data['oldPrice'] = oldPrice;
    data['price'] = price;
    return data;
  }
}
