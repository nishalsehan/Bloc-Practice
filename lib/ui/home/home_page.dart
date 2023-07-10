
import 'package:bloc_practice/repositories/services/game_service.dart';
import 'package:bloc_practice/repositories/store_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [

          ],
          child: const Dashboard(),
        ),
      ),
    );
  }

}