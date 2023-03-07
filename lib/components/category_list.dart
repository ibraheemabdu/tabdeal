

import 'package:done_deal/components/subcategory_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/app_consts.dart';
import '../app/helper_clasess/var.dart';
import '../dummy_data.dart';
import 'package:get/get.dart';
class HomeCategoryList extends StatefulWidget {
  var data ;
  HomeCategoryList(this.data);
  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}


class _HomeCategoryListState extends State<HomeCategoryList> {
  int currentSelected = 0;
  AppDataModel appDataModel = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    appDataModel.cat = widget.data ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected = i;
                  });
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: currentSelected == i
                        ? AppColors.darkGrey
                        : AppColors.lightGrey,
                  ),
                  child: Center(
                    child: Text(
                     widget.data[i]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: currentSelected == i
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Divider(thickness: 1,color: Colors.black),
        HomeSubCategoryList(widget.data[currentSelected]['sub_categoris'])
      ],
    );
  }
}
