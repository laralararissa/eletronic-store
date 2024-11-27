import 'package:flutter/material.dart';
import 'package:store/stores/favorite_store.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ValueListenableBuilder(
          valueListenable: FavoriteStore.instance,
          builder: (context, value, child) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: FavoriteStore.instance.value.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final product = FavoriteStore.instance.value[index];
                return Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(product.image),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(product.price.toStringAsFixed(2)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FavoriteStore.instance.toggleFavorite(product);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
