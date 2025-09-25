// lib/features/shell/presentation/cubit/shell_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shell_state.dart';

class ShellCubit extends Cubit<ShellState> {
  ShellCubit() : super(const ShellState());

  void setTab(int i) => emit(state.copyWith(index: i));

  void updateFavCount(int c) => emit(state.copyWith(favCount: c));
  void updateCartCount(int c) => emit(state.copyWith(cartCount: c));
}
