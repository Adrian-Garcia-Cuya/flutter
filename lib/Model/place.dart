class Place {
  final String id;
  final String name;
  final String tag;
  final String location;
  final Uri image;
  final double price;

  Place({
    required this.id,
    required this.name,
    required this.tag,
    required this.location,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'location': location,
      'image': image.toString(),
      'price': price,
    };
  }

  @override
  String toString() {
    return 'Place( name: $name, image: $image, price: $price)';
  }
}
