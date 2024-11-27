import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  const Category({required this.name, required this.image});
}

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (_, __) => const SizedBox(width: 50),
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xffCDCDCD),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                categories[index].image,
                width: 20,
                height: 20,
              ),
            ),
            Text(categories[index].name),
          ],
        ),
      ),
    );
  }
}
