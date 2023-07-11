
import 'package:bloc_practice/repositories/services/game_service.dart';
import 'package:bloc_practice/repositories/store_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard.dart';
import '../widgets/category_widget/bloc/category_bloc.dart';
import '../widgets/category_widget/bloc/category_event.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetCategories()),
            ),
          ],
          child: const Dashboard(),
        ),
      ),
    );
  }

}