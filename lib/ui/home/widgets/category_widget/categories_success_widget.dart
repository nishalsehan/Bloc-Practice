
import 'package:bloc_practice/repositories/models/genre.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_event.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_state.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/category_item.dart';
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
          height: size.height*0.1,
          width: size.width,
          child: ListView.separated(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(
                width: 16.0,
              ),
              itemBuilder: (context, index){
                return CategoryItem(
                  genre: state.categories[index],
                  onClick: (Genre genre){
                      context.read<CategoryBloc>().add(
                        SelectCategory(
                            idSelected: genre.id
                        ),
                      );
                  },
                );
              }
          ),
        );
      },
    );
  }

}