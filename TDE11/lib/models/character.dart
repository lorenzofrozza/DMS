class Character {
  final int id;
  final String name;
  final String image;
  final String originName;

  const Character({
    required this.id,
    required this.name,
    required this.image,
    required this.originName,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      originName: json["origin"]?["name"] ?? "Unknown",
    );
  }
}
