class Product {
  final int id;
  final String name;
  final String image;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  Product copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ image.hashCode ^ price.hashCode;

  @override
  String toString() =>
      'Product(id: $id, name: $name, image: $image, price: $price)';
}
