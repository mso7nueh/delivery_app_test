import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/feature/domain/usecases/get_all_categories.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_lsit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CategoryListCubit extends Cubit<CategoryState> {
  final GetAllCategories getAllCategories;

  CategoryListCubit({required this.getAllCategories}) : super(CategoryEmpty());

  Future<void> loadCategories() async {
    if (state is CategoryLoading) return;

    emit(CategoryLoading());

    final failureOrPCategory = await getAllCategories(GetAllCategoriesParams());

    failureOrPCategory.fold(
        (error) => emit(CategoryError(message: _mapFailureToMessage(error))),
        (categories) => emit(CategoryLoaded(categoryList: categories)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
