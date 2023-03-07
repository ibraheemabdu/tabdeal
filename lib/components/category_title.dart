import 'package:flutter/material.dart';

import '../app/app_consts.dart';

class CategoryTitle extends StatelessWidget {
  final String title;



  const CategoryTitle({
    Key? key,
    required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}
