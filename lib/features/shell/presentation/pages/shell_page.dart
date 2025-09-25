// lib/features/shell/presentation/pages/shell_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../browse/presentation/pages/browse_tab.dart';
import '../../../home/presentation/pages/home_tab.dart';
import '../cubit/shell_cubit.dart';
import '../cubit/shell_state.dart';
import '../widgets/bottom_nav.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});
  @override
  Widget build(_) => const Center(child: Text('Favourites'));
}

class CartTab extends StatelessWidget {
  const CartTab({super.key});
  @override
  Widget build(_) => const Center(child: Text('Cart'));
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(_) => const Center(child: Text('Profile'));
}

class ShellPage extends StatelessWidget {
  const ShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShellCubit()
        ..updateFavCount(6) // mock เริ่มต้น (ต่อ data layer จริงภายหลัง)
        ..updateCartCount(2),
      child: const _ShellView(),
    );
  }
}

class _ShellView extends StatelessWidget {
  const _ShellView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShellCubit, ShellState>(
      buildWhen: (p, c) => p.index != c.index,
      builder: (context, state) {
        final cubit = context.read<ShellCubit>();
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: const [
              HomeTab(),
              BrowseTab(),
              FavTab(),
              CartTab(),
              ProfileTab(),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.index,
            onTap: (index) => cubit.setTab(index),
          ),
        );
      },
    );
  }
}
