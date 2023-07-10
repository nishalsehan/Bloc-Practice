

import 'dart:async';

import 'package:bloc_practice/repositories/models/genre.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_event.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repositories/store_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{

  final GameRepository gameRepository;

  CategoryBloc({required this.gameRepository}) : super(const CategoryState()) {
    on<GetCategories>(_mapGetCategoriesEventToState);
    on<SelectCategory>(_mapSelectCategoryEventToState);
  }


  Future<void> _mapGetCategoriesEventToState(GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try{
      final genres = await gameRepository.getGenres();
      if(genres.status){
        emit(state.copyWith(categories: (genres.data??[]) as List<Genre>,status: CategoryStatus.success));
      }else{
        emit(state.copyWith(status: CategoryStatus.error));
      }
    }catch(e){
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapSelectCategoryEventToState(SelectCategory event, Emitter<CategoryState> emit) {

  }
}