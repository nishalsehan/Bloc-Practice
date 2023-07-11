

import 'package:flutter/material.dart';

import '../widgets/category_widget/category_barrel.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: padding.top + size.height*0.05,
        ),
        const CategoriesWidget(),
      ],
    );
  }



}