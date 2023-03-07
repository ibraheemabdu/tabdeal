
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_consts.dart';
import '../../../../app/helper_clasess/var.dart';
class AddProductSubCategoryList extends StatefulWidget {
  var data ;
  AddProductSubCategoryList(this.data);
  @override
  State<AddProductSubCategoryList> createState() => _AddProductSubCategoryListState();
}


class _AddProductSubCategoryListState extends State<AddProductSubCategoryList> {
  int currentSelected2 = 0;
  AppDataModel appDataModel = Get.find();
  @override
  void initState() {
    appDataModel.subCat = widget.data[0]['id'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics:  BouncingScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected2 = i;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        color: currentSelected2 == i
                            ? AppColors.darkGrey
                            : AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/pictures/clothes_shop.jpg',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            currentSelected2 == i
                                ? Colors.black.withOpacity(.5)
                                : Colors.black.withOpacity(.85),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.data[i]['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: currentSelected2 == i
                              ? FontWeight.w800
                              : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),



                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
