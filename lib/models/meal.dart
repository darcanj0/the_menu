class Meal {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final String description;
  final int durationInMinutes;
  final List<String> categoriesIds;
  final int servesHowManyPeople;
  final bool isGlutenFree;
  final bool isDairyFree;
  final bool isVeggie;
  final bool isVegan;

  const Meal({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.durationInMinutes,
    required this.categoriesIds,
    required this.isDairyFree,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVeggie,
    required this.servesHowManyPeople,
  });
}
