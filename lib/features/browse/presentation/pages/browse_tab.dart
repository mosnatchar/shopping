// lib/features/browse/presentation/pages/browse_tab.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/cubit/favorites_cubit.dart';
import '../../../shell/presentation/cubit/shell_cubit.dart';
import '../../domain/product.dart';
import 'widgets/filter_pill.dart';
import 'widgets/filter_pills_row.dart';
import 'widgets/product_card.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = -1; // -1 = ไม่ได้เลือก pill ใด ๆ

  final List<String> _labels = const ["Category", "Brand", "Price", "Offers"];
  final products = const [
    Product(
      id: 'sony-bk',
      name: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
      price: 349.99,
      image: 'assets/images/sony_black.png',
    ),
    Product(
      id: 'sony-bg',
      name: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Beige',
      price: 349.99,
      image: 'assets/images/sony_beige.png',
    ),
    Product(
      id: 'airpods-pro',
      name: 'APPLE AirPods Pro MagSafe Case',
      subtitle: 'NC, 4 h, Wireless',
      price: 179.00,
      image: 'assets/images/airpods.png',
    ),
    Product(
      id: 'buds2-pro',
      name: ' SAMSUNG Galaxy Buds 2 Pro',
      subtitle: 'NC, 6 h, Wireless',
      price: 119.99,
      oldPrice: 149.99,
      image: 'assets/images/buds2pro.png',
    ),
    Product(
      id: 'sony-bk',
      name: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
      price: 349.99,
      image: 'assets/images/mic.png',
    ),
    Product(
      id: 'sony-bg',
      name: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Beige',
      price: 349.99,
      image: 'assets/images/sony_beige.png',
    ),
    Product(
      id: 'airpods-pro',
      name: 'APPLE AirPods Pro MagSafe Case',
      subtitle: 'NC, 4 h, Wireless',
      price: 179.00,
      image: 'assets/images/airpods.png',
    ),
    Product(
      id: 'buds2-pro',
      name: 'SAMSUNG Galaxy Buds 2 Pro',
      subtitle: 'NC, 6 h, Wireless',
      price: 119.99,
      oldPrice: 149.99,
      image: 'assets/images/buds2pro.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              context.read<ShellCubit>().setTab(0);
            },
          ),
          title: const Text(
            "Headphones",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              iconSize: 18,
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {
                // TODO: ไปหน้า Search
              },
            ),
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: 64,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: SizedBox(
                  height: 64,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/images/filter.png",
                          width: 18,
                          height: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // แถว pills ที่เลื่อนแนวนอน
                      Expanded(
                        child: FilterPillsRow(
                          padding: const EdgeInsets.only(right: 16),
                          children: List.generate(_labels.length, (i) {
                            return FilterPill(
                              label: _labels[i],
                              selected: selectedIndex == i,
                              onTap: () => setState(() => selectedIndex = i),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 16, 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "13’134 products",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Sort by ",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "Relevance",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.70,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => ProductCard(product: products[i]),
                    childCount: products.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
