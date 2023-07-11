

import 'package:equatable/equatable.dart';

class AllGamesEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetAllGames extends AllGamesEvent{}

class ClickAGame extends AllGamesEvent{

  final int clickedId;

  ClickAGame({
    required this.clickedId
  });

  @override
  List<Object?> get props => [clickedId];
}