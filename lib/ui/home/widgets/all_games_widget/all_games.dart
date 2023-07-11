

import 'package:bloc_practice/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:bloc_practice/ui/home/widgets/all_games_widget/bloc/all_games_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGamesWidget extends StatelessWidget{

  const AllGamesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc,AllGamesState>(
        builder: (context, state){
          return Container();
        }
    );
  }

}