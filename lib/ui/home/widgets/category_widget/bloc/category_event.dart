

import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategories extends CategoryEvent{}

class SelectCategory extends CategoryEvent {
  SelectCategory({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}