// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_bar_bloc.dart';

abstract class NavigationBarState extends Equatable {
  const NavigationBarState();

  @override
  List<Object> get props => [];
}

class NavigationBarInitial extends NavigationBarState {
  final int initialIndex;
  const NavigationBarInitial({
    required this.initialIndex,
  });

  @override
  List<Object> get props => [initialIndex];

  NavigationBarInitial copyWith({
    int? initialIndex,
  }) {
    return NavigationBarInitial(
      initialIndex: initialIndex ?? this.initialIndex,
    );
  }
}
