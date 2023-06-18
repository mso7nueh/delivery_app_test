import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_event.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final int index = 0;
  final String category = '';

  NavigationBloc() : super(const NavigationIndexState(index: 0, category: '')) {
    on<NavigationIndexChange>((event, emit) {
      emit(NavigationIndexState(index: event.index, category: event.category));
    });
  }
}
