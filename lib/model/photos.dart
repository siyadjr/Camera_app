class Photos {
  final String image;

  Photos({required this.image});

  static Photos fromMap(Map<String, dynamic> map) {
    return Photos(image: map['image']);
  }
}
