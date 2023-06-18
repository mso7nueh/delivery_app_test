import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  final int index;
  final String category;

  const NavigationState(this.index, this.category);

  @override
  List<Object?> get props => [index, category];
}

class NavigationIndexState extends NavigationState {
  final int index;
  final String category;

  const NavigationIndexState({required this.index, required this.category}) : super(index, category);

  @override
  List<Object?> get props => [index, category];
}
