
import 'package:bloc_practice/repositories/models/genre.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_state.dart';

class CategoryItem extends StatelessWidget{
  final Genre genre;
  final Function(Genre) onClick;
  const CategoryItem({super.key, required this.genre, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final padding = MediaQuery.of(context).padding;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        onClick(genre);
      },
      child: BlocSelector<CategoryBloc,CategoryState,bool>(
        selector: (state) => state.status.isSelected && state.idSelected == genre.id,
        builder: (context, state){
          return Container(
            height: size.height*0.1,
            alignment: Alignment.center,
            // width: size.width*0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state?Colors.orange.shade500:Colors.lightBlueAccent.withOpacity(0.2)
                  ),
                  padding: EdgeInsets.all(size.height*0.015),
                  child: Icon(
                    Icons.category_outlined,
                    size: size.height*0.02,
                    color: state?Colors.white:Colors.black,
                  ),
                ),
                SizedBox(
                  height: size.height*0.005,
                ),
                Text(
                  "${genre.name}",
                  style: TextStyle(
                      fontSize: size.height*0.01
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}