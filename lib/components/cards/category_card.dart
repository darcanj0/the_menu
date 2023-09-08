import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({required this.category, super.key});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = AssetImage(widget.category.imagePath);
  }

  @override
  void didChangeDependencies() {
    precacheImage(image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
                opacity: 0.35,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                colors: [
                  widget.category.color.withOpacity(0.9),
                  widget.category.color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.black26,
                width: 1,
              )),
          child: Center(
            child: Text(
              widget.category.title,
              style: textTheme.headlineMedium,
            ),
          )),
    );
  }
}
