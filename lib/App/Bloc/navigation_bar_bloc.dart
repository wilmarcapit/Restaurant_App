import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const NavigationBarInitial(initialIndex: 0)) {
    on<OnChangeTab>(_onChangeTab);
  }

  _onChangeTab(
    OnChangeTab event,
    Emitter<NavigationBarState> emit,
  ) {
    emit(const NavigationBarInitial(initialIndex: 1)
        .copyWith(initialIndex: event.indexTab));
  }
}
