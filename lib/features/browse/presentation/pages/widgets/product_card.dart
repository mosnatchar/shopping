// lib/features/browse/presentation/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/cubit/favorites_cubit.dart';
import '../../../domain/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  clipBehavior: Clip.hardEdge, // หรือ Clip.antiAlias
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(245, 245, 245, 245),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Image.asset(product.image, fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 0, // ไม่มีเงา (กันเงาล้น)
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () =>
                              context.read<FavoritesCubit>().toggle(product.id),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                _money(product.price),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: product.oldPrice != null
                      ? const Color(0xFFFF2D55)
                      : Colors.black,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(width: 6),
              if (product.oldPrice != null)
                Text(
                  _money(product.oldPrice!),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),

          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),

          Text(
            product.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }

  String _money(double v) => '\$${v.toStringAsFixed(2)}';
}
