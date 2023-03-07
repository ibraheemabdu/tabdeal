

import 'package:done_deal/features/Product_list/presentation/pages/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/app_consts.dart';
import '../dummy_data.dart';
import 'package:get/get.dart';
class HomeSubCategoryList extends StatefulWidget {
  var data ;
  HomeSubCategoryList(this.data);
  @override
  State<HomeSubCategoryList> createState() => _HomeSubCategoryListState();
}


class _HomeSubCategoryListState extends State<HomeSubCategoryList> {


  int currentSelected2 = 0;

  @override
  Widget build(BuildContext context) {

    
    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                Get.to(ProductList(widget.data[i]['id']));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.data[i]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800 ,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}
