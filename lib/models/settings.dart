class MealFilter {
  bool isGlutenFree;
  bool isDairyFree;
  bool isVeggie;
  bool isVegan;

  MealFilter({
    required this.isGlutenFree,
    required this.isDairyFree,
    required this.isVegan,
    required this.isVeggie,
  });

  factory MealFilter.clear() => MealFilter(
        isGlutenFree: false,
        isDairyFree: false,
        isVegan: false,
        isVeggie: false,
      );

  MealFilter copyWith({
    bool? isGlutenFree,
    bool? isDairyFree,
    bool? isVeggie,
    bool? isVegan,
  }) =>
      MealFilter(
        isGlutenFree: isGlutenFree ?? this.isGlutenFree,
        isDairyFree: isDairyFree ?? this.isDairyFree,
        isVegan: isVegan ?? this.isVegan,
        isVeggie: isVeggie ?? this.isVeggie,
      );
}
