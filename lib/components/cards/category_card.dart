import 'package:flutter/material.dart';
import 'package:the_menu/utils/routes.dart';

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

  void _selectCategory(BuildContext ctx) {
    Navigator.of(context)
        .pushNamed(AppRoutes.categoryMeals.name, arguments: widget.category);
  }

  static const BorderRadius cardBorderRadius =
      BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: cardBorderRadius,
        onTap: () => _selectCategory(context),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: cardBorderRadius,
                border: Border.all(
                  color: Colors.black26,
                  width: 1,
                )),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: cardBorderRadius,
                  image: DecorationImage(image: image, fit: BoxFit.cover)),
              child: Ink(
                decoration: BoxDecoration(
                  color: widget.category.color.withOpacity(0.3),
                  borderRadius: cardBorderRadius,
                ),
                child: Center(
                  child: Text(
                    widget.category.title,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

  // image: DecorationImage(
  //   image: image,
  //   fit: BoxFit.cover,
  //   opacity: 0.35,
  // )

  //   gradient: LinearGradient(
  //   colors: [
  //     widget.category.color.withOpacity(0.9),
  //     widget.category.color
  //   ],
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  // ),