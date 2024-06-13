class Recipe {
  final List<RecipeStep> steps;

  Recipe({required this.steps});

  @override
  String toString() {
    var complete = '';
    for (var i = 0; i < steps.length; i++) {
      complete += steps[i].toString();
      if (i != steps.length - 1) {
        complete += '\n';
      }
    }
    return complete;
  }
}

class RecipeStep {
  final int number;
  final String description;

  RecipeStep({required this.number, required this.description});

  @override
  String toString() {
    return '$number - $description';
  }
}
