

import 'package:equatable/equatable.dart';

import '../../../../../repositories/models/genre.dart';

enum CategoryStatus{initial, loading, success, error, selected}

extension CategoryStatusX on CategoryStatus{
  bool get isInitial => this == CategoryStatus.initial;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isError => this == CategoryStatus.error;
  bool get isSelected => this == CategoryStatus.selected;
}

class CategoryState extends Equatable{
  final List<Genre> categories;
  final CategoryStatus status;
  final int idSelected;

  const CategoryState({List<Genre>? categories,this.status = CategoryStatus.initial,this.idSelected = 0,}):
        categories = categories ?? const [];
  @override
  // TODO: implement props
  List<Object?> get props => [status, categories, idSelected];


  CategoryState copyWith({List<Genre>? categories,CategoryStatus? status, int? idSelected}){
    return CategoryState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected
    );
  }
}