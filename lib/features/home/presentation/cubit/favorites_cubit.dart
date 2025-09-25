// lib/features/favorites/presentation/cubit/favorites_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final Set<String> ids; // เก็บ id ของสินค้าที่ถูกกดหัวใจ

  const FavoritesState({this.ids = const {}});
  bool isFav(String id) => ids.contains(id);

  FavoritesState copyWith({Set<String>? ids}) =>
      FavoritesState(ids: ids ?? this.ids);

  @override
  List<Object?> get props => [ids];
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggle(String id) {
    final s = state.ids.toSet();
    if (s.contains(id)) {
      s.remove(id);
    } else {
      s.add(id);
    }
    emit(state.copyWith(ids: s));
  }
}
