

import 'dart:convert';

import 'package:bloc_practice/repositories/models/genre.dart';
import 'package:bloc_practice/repositories/models/response_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/game.dart';

class GameService {
  final String baseUrl;
  final Client _httpClient;

  GameService({this.baseUrl = "https://api.rawg.io/api/", http.Client? httpClient}): _httpClient = httpClient ?? http.Client();

  Uri getUrl({required String url,Map<String, String>? extraParameters}){
    final queryParameters = <String,String>{
      "key":"9e3c3ca6ad3c4d479bd4574aea925d55"
    };
    if(extraParameters != null){
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse("$baseUrl$url").replace(queryParameters: queryParameters);
  }

  Future<ResponseData> getGames() async {
    final response =  await _httpClient.get(getUrl(url:"games"));
    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        List list = jsonDecode(response.body)['result'];
        return ResponseData(data: list.map((e) => Game.fromJson(e)).toList(),true);
      }else{
        return ResponseData(false,error: "No data available");
      }
    }else{
      return ResponseData(false, error: 'Error getting games');
    }
  }

  Future<ResponseData> getGenres() async {
    final response =  await _httpClient.get(getUrl(url:"genres"));
    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        List list = jsonDecode(response.body)['result'];
        return ResponseData(data: list.map((e) => Genre.fromJson(e)).toList(), true);
      }else{
        return ResponseData(false,error: "No data available");
      }
    }else{
      return ResponseData(false, error: 'Error getting games');
    }
  }

  Future<ResponseData> getGamesByCategory(int genreId) async {
    final response =  await _httpClient.get(getUrl(
        url:"games",
        extraParameters: {
          "genres": genreId.toString()
        }
    ));
    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        List list = jsonDecode(response.body)['result'];
        return ResponseData(true,data: list.map((e) => Game.fromJson(e)).toList());
      }else{
        return ResponseData(false,error: "No data available");
      }
    }else{
      return ResponseData(false, error: 'Error getting games');
    }
  }



}