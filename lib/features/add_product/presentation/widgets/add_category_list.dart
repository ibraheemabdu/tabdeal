

import 'package:done_deal/components/subcategory_list.dart';
import 'package:done_deal/features/add_product/presentation/widgets/add_subcategory_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../app/app_consts.dart';
import '../../../../app/helper_clasess/var.dart';
import '../../../../dummy_data.dart';
class AddProductCategoryList extends StatefulWidget {
  var data ;
  AddProductCategoryList(this.data);
  @override
  State<AddProductCategoryList> createState() => _AddProductCategoryListState();
}


class _AddProductCategoryListState extends State<AddProductCategoryList> {
  int currentSelected = 0;
  AppDataModel appDataModel = Get.find();

  var cat ;
  @override
  void initState() {
    cat = appDataModel.cat ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: cat.length,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelected = i;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: currentSelected == i
                              ? AppColors.darkGrey
                              : AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: const AssetImage(
                              'assets/pictures/clothes_shop.jpg',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              currentSelected == i
                                  ? Colors.black.withOpacity(.5)
                                  : Colors.black.withOpacity(.85),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(cat[i]['image'],
                              height: 24,
                              width: 24,
                              color: currentSelected == i
                                  ? Colors.white
                                  : AppColors.grey,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              cat[i]['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: currentSelected == i
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
        AddProductSubCategoryList(cat[currentSelected]['sub_categoris'])
      ],
    );
  }
}
