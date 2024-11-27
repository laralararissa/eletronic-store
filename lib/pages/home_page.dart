import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/pages/tracking_page.dart';
import 'package:store/stores/favorite_store.dart';
import 'package:store/widgets/categories_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FavoriteStore favoriteStore = FavoriteStore.instance;
  final List<Product> products = [
    const Product(
      id: 1,
      name: 'Smart TV LED 50"',
      price: 2499.00,
      image: 'assets/1.png',
    ),
    const Product(
      id: 2,
      name: 'Notebook Gamer',
      price: 1499.00,
      image: 'assets/2.png',
    ),
  ];

  final List<Product> products2 = [
    const Product(
      id: 3,
      name: 'Headset Gamer',
      price: 2499.00,
      image: 'assets/3.png',
    ),
    const Product(
      id: 4,
      name: 'Fones de Ouvido',
      price: 1499.00,
      image: 'assets/4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const CategoriesList(
            categories: [
              Category(name: 'TVs', image: 'assets/tv.png'),
              Category(name: 'Tablets', image: 'assets/ipad.png'),
              Category(name: 'Monitores', image: 'assets/monitor.png'),
              Category(name: 'Informática', image: 'assets/pc_support.png'),
            ],
          ),
          const SizedBox(height: 20),
          ProductGridSection(title: 'Produtos', products: products),
          const SizedBox(height: 20),
          ProductGridSection(title: 'Em Alta', products: products2),
        ],
      ),
    );
  }
}

class ProductGridSection extends StatefulWidget {
  final String title;
  final List<Product> products;
  const ProductGridSection(
      {super.key, required this.title, required this.products});

  @override
  State<ProductGridSection> createState() => _ProductGridSectionState();
}

class _ProductGridSectionState extends State<ProductGridSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrackingPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  product.image,
                                  height: 100,
                                ),
                              ),
                            ),
                            ValueListenableBuilder(
                                valueListenable: FavoriteStore.instance,
                                builder: (context, value, child) {
                                  return Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      onPressed: () {
                                        FavoriteStore.instance
                                            .toggleFavorite(product);
                                      },
                                      icon: FavoriteStore.instance
                                              .isFavorite(product)
                                          ? const Icon(
                                              Icons.favorite,
                                              size: 20,
                                            )
                                          : const Icon(
                                              Icons.favorite_border,
                                              size: 20,
                                            ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.price.toStringAsFixed(2),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
