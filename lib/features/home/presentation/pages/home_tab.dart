// lib/features/home/presentation/pages/home_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../browse/domain/product.dart';
import '../../../browse/presentation/pages/widgets/product_card.dart';
import '../cubit/favorites_cubit.dart';
import 'wigets/category_tab_bar.dart';
import 'wigets/deals_of_day.dart';
import 'wigets/header_wiget.dart';

class HomeTab extends StatelessWidget {
  final String userName;
  const HomeTab({super.key, this.userName = 'Michael'});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: _HomeView()));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    // คุณสามารถดึงชื่อจาก provider/bloc ได้ในภายหลัง
    const name = 'Michael';

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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeHeader(name: name)),
        SliverToBoxAdapter(
          child: CategoryTabBar(
            items: const [
              'All',
              'Audio',
              'Drones + Electronics',
              'Photo + Video',
              'Accessories',
            ],
            initialIndex: 0,
            onChanged: (i) {
              // TODO: โหลด/กรองสินค้า ตามหมวด i
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (_) => FavoritesCubit(),
            child: const DealsOfDaySection(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Recommended for you",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
    );
  }
}
