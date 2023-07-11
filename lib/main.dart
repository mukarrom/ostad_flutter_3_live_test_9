import 'package:flutter/material.dart';
import 'package:ostad_flutter_3_livetest_9/food_recipes.dart';
import 'package:ostad_flutter_3_livetest_9/recipes_model.dart';

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
