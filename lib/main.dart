import 'package:flutter/material.dart';

Map recipes = {
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "Ingredients": ["spaghetti", "bacon", "+88", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description":
          "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "Ingredients": ["tomatoes", "nozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "Ingredients": ["bananas", "nilk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "Ingredients": ["chicken breast", "broccols", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "Ingredients": ["salmon fillet", "lemon", "olive oil", "1"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "Ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "Ingredients": ["berries", "yogurt", "granola"]
    }
  ]
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Foods',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Food> foodData = [];

  @override
  void initState() {
    super.initState();
    data();
  }

  void data() {
    for (var e in recipes['recipes']) {
      foodData.add(Food.toJson(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: foodData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodData[index].title),
            subtitle: Text(foodData[index].description),
          );
        },
      ),
    );
  }
}

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
