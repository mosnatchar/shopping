// lib/features/home/presentation/widgets/deals_of_day.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/dealItem.dart';
import '../../cubit/favorites_cubit.dart';

class DealsOfDaySection extends StatelessWidget {
  const DealsOfDaySection({super.key});

  final _items = const [
    DealItem(
      id: 'podmic',
      image: 'assets/images/mic.png',
      category: 'Microphones',
      price: 108.20,
      oldPrice: 199.99,
      name: 'RØDE PodMic',
      subtitle: 'Dynamic microphone, Speaker microphone',
    ),
    DealItem(
      id: 'usb-mini',
      image: 'assets/images/mic.png',
      category: 'Microphones',
      price: 89.90,
      oldPrice: 149.00,
      name: 'USB Mini Mic',
      subtitle: 'USB, Plug and play',
    ),
    DealItem(
      id: 'usb-mini',
      image: 'assets/images/mic.png',
      category: 'Microphones',
      price: 89.90,
      oldPrice: 149.00,
      name: 'USB Mini Mic',
      subtitle: 'USB, Plug and play',
    ),
    DealItem(
      id: 'usb-mini',
      image: 'assets/images/mic.png',
      category: 'Microphones',
      price: 89.90,
      oldPrice: 149.00,
      name: 'USB Mini Mic',
      subtitle: 'USB, Plug and play',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Deals of the day',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 185, child: _DealsPager(items: _items)),
      ],
    );
  }
}

class _DealsPager extends StatefulWidget {
  final List<DealItem> items;
  const _DealsPager({required this.items});

  @override
  State<_DealsPager> createState() => _DealsPagerState();
}

class _DealsPagerState extends State<_DealsPager> {
  final _ctrl = PageController(viewportFraction: .93);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => DealCard(item: widget.items[i]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (i) {
            final selected = i == _index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              width: selected ? 35 : 9,
              decoration: BoxDecoration(
                color: selected ? Colors.black87 : Colors.black26,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class DealCard extends StatelessWidget {
  final DealItem item;
  const DealCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color.fromARGB(245, 245, 245, 245),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 160,
                  height: 170,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.category,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xffff2d55),
                            ),
                          ),
                          const SizedBox(width: 4),
                          if (item.oldPrice != null)
                            Text(
                              '\$${item.oldPrice!.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 2),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              buildWhen: (p, c) => p.isFav(item.id) != c.isFav(item.id),
              builder: (context, state) {
                final isFav = state.isFav(item.id);
                return Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 2,
                  shadowColor: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => context.read<FavoritesCubit>().toggle(item.id),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: isFav ? Colors.black : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
