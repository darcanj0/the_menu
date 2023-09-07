import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.black26,
              width: 1,
            )),
        child: Center(
          child: Text(
            category.title,
          ),
        ));
  }
}
