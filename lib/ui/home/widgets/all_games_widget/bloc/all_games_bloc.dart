

import 'dart:async';

import 'package:bloc_practice/ui/home/widgets/all_games_widget/bloc/all_games_event.dart';
import 'package:bloc_practice/ui/home/widgets/all_games_widget/bloc/all_games_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repositories/models/game.dart';
import '../../../../../repositories/store_repository.dart';

class AllGamesBloc extends Bloc<AllGamesEvent,AllGamesState>{

  final GameRepository gameRepository;

  AllGamesBloc({required this.gameRepository}) : super(AllGamesState()){
    on<GetAllGames>(mapGetAllGamesEventToState);
    on<ClickAGame>(mapClickAGameEventToState);
  }

  Future<FutureOr<void>> mapGetAllGamesEventToState(GetAllGames event, Emitter<AllGamesState> emit) async {
    emit(state.copyWith(status: AllGamesStatus.loading));
    try{
      final responseData = await gameRepository.getGames();
      if(responseData.status){
        emit(state.copyWith(status: AllGamesStatus.success,games: (responseData.data ?? []) as List<Game>));
      }else{
        print(responseData.error);
        emit(state.copyWith(status: AllGamesStatus.error));
      }
    }catch(e){
      print(e);
      emit(state.copyWith(status: AllGamesStatus.error));
    }
  }

  FutureOr<void> mapClickAGameEventToState(ClickAGame event, Emitter<AllGamesState> emit) {
    emit(state.copyWith(status: AllGamesStatus.clicked,clickedId: event.clickedId));
  }
}