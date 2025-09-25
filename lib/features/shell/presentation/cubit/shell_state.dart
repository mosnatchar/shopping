// lib/features/shell/presentation/cubit/shell_state.dart
import 'package:equatable/equatable.dart';

class ShellState extends Equatable {
  final int index;
  final int favCount;
  final int cartCount;

  const ShellState({this.index = 0, this.favCount = 0, this.cartCount = 0});

  ShellState copyWith({int? index, int? favCount, int? cartCount}) {
    return ShellState(
      index: index ?? this.index,
      favCount: favCount ?? this.favCount,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object?> get props => [index, favCount, cartCount];
}
