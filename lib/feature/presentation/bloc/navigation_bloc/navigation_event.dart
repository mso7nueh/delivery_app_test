import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  final int index = 0;
  final String category = '';

  const NavigationEvent();

  @override
  List<Object?> get props => [index, category];
}

class NavigationIndexChange extends NavigationEvent {
  @override
  final int index;
  @override
  final String category;

  const NavigationIndexChange({required this.index, required this.category});

  @override
  List<Object?> get props => [index, category];
}
