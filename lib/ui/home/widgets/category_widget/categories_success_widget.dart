
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSuccessWidget extends StatelessWidget{

  const CategoriesSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoryBloc,CategoryState>(
      builder: (context, state){
        return SizedBox(
          height: size.height*0.2,
          width: size.width,
          child: ListView.builder(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container();
              }
          ),
        );
      },
    );
  }

}