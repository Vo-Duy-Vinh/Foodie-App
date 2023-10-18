import 'package:flutter/material.dart';

import '../components/food_items.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colors = [
    Colors.black,
    Colors.green,
    Color.fromARGB(255, 246, 135, 172),
    Color.fromARGB(255, 155, 80, 155)
  ];
  final _colorNames = ['B', 'G', 'P', 'V'];
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.yellow),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          ...List.generate(
            _colors.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = _colors[index];
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.6),
                child: CircleAvatar(
                  backgroundColor: _colors[index],
                  radius: 14.0,
                  child: Text(
                    _colorNames[index],
                    style: const TextStyle(color: Colors.blue, fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Foodies',
                style: TextStyle(color: _selectedColor, fontSize: 32.0),
              ),
              const SizedBox(height: 12.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  FoodModel food = foods[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.6),
                    child: FoodItem(
                      onPressed: () => print(food.id),
                      food: food,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
