// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_bar_bloc.dart';

abstract class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();

  @override
  List<Object> get props => [];
}

class OnChangeTab extends NavigationBarEvent {
  final int indexTab;
  const OnChangeTab({
    required this.indexTab,
  });

  @override
  List<Object> get props => [indexTab];
}
