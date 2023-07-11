class Food {
  final String title, description;
  final List<String> ingredients;

  Food(this.title, this.description, this.ingredients);

// factory method
  factory Food.toJson(Map<String, dynamic> e) {
    return Food(
      e['title'],
      e['description'],
      e['Ingredients'],
    );
  }
}
