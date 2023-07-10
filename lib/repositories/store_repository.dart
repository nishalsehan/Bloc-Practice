
import 'package:bloc_practice/repositories/models/response_data.dart';
import 'services/game_service.dart';

class GameRepository {
  const GameRepository({
    required this.service,
  });

  final GameService service;

  Future<ResponseData> getGames() async => service.getGames();

  Future<ResponseData> getGenres() async => service.getGenres();

  Future<ResponseData> getGamesByCategory(int genreId) async => service.getGamesByCategory(genreId);
}