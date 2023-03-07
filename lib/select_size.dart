
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app/app_consts.dart';

class SizeModel {
  String title;

  SizeModel({required this.title});
}

class DetailScreenSelectSize extends StatefulWidget {
  const DetailScreenSelectSize({Key? key}) : super(key: key);

  @override
  State<DetailScreenSelectSize> createState() => _DetailScreenSelectSizeState();
}

class _DetailScreenSelectSizeState extends State<DetailScreenSelectSize> {
  int currentSelected = 2;

  List<SizeModel> sizesList = [
    SizeModel(title: 'S'),
    SizeModel(title: 'M'),
    SizeModel(title: 'L'),
    SizeModel(title: 'XL'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child:
      Row(
        children: [
          SizedBox(width: 5,),

          SvgPicture.asset(
            'assets/svg/shirt.svg',
            height: 44,
            width: 44,
            color: AppColors.grey,
          ),
          SizedBox(width: 5,),
          SvgPicture.asset(
            'assets/svg/dress.svg',
            height: 44,
            width: 44,
            color: AppColors.grey,
          ),
          SizedBox(width: 5,),
          SvgPicture.asset(
            'assets/svg/jeans.svg',
            height: 44,
            width: 44,
            color: AppColors.grey,
          ),
          SizedBox(width: 5,),
          SvgPicture.asset(
            'assets/svg/shoes.svg',
            height: 44,
            width: 44,
            color: AppColors.grey,
          ),
        ],
      )
    );
  }
}
