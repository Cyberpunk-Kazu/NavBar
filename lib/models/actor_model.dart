class ActorModel {
  final String id;
  final String name;
  final String alias;
  final String birthDate;
  final String birthPlace;
  final String category;
  final String biography;
  final String imageUrl;
  final List<String> famousWorks;
  final List<String> awards;
  final int yearsActive;
  final double rating;
  bool isFavorite;

  ActorModel({
    required this.id,
    required this.name,
    required this.alias,
    required this.birthDate,
    required this.birthPlace,
    required this.category,
    required this.biography,
    required this.imageUrl,
    required this.famousWorks,
    required this.awards,
    required this.yearsActive,
    required this.rating,
    this.isFavorite = false,
  });
}
