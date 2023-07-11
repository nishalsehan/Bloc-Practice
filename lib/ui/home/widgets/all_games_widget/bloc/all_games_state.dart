

import 'package:equatable/equatable.dart';

import '../../../../../repositories/models/game.dart';

enum AllGamesStatus {initial, success, error, loading, clicked}

extension AllGamesStatusX on AllGamesStatus{
  bool get isInitial => this == AllGamesStatus.initial;
  bool get isSuccess => this == AllGamesStatus.success;
  bool get isError => this == AllGamesStatus.error;
  bool get isLoading => this == AllGamesStatus.loading;
  bool get isClicked => this == AllGamesStatus.clicked;
}

class AllGamesState extends Equatable{
  final List<Game> games;
  final int clickedId;
  final AllGamesStatus status;

  AllGamesState({List<Game>? games, this.clickedId = 0,this.status = AllGamesStatus.initial}): games = games ?? [];

  @override
  List<Object?> get props => [games, status, clickedId];

  AllGamesState copyWith({List<Game>? games,int? clickedId,AllGamesStatus? status}){
    return AllGamesState(
        status: status ?? this.status,
        games: games ?? this.games,
        clickedId: clickedId ?? this.clickedId
    );
  }
}