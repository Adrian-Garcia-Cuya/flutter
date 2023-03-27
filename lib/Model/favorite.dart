class Favorite {
  final String? id;
  final String img;
  final String name;
  final String price;
  final String country;

  Favorite({
    this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'price': price,
      'country': country,
    };
  }
}
