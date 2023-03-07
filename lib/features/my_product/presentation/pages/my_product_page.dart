import 'package:done_deal/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:done_deal/features/my_product/data/datasources/api_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../app/app_consts.dart';
import '../../../../app/custom_text_form_field.dart';
import '../../../../app_buttons.dart';
import '../../../../components/popular_list.dart';
import '../../../../dummy_data.dart';
import '../../../product_details/presentation/pages/product_details_page.dart';
import '../../data/datasources/api.dart';


class MyProductPage extends StatefulWidget {

  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  int currentPage = 1;

  late int totalPages = 0;

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  var data ;
  List hospitalsList = [];

  Future<bool> _getDoctorData({bool isRefresh = false}) async {


    var result = await getMyProductData('en', currentPage) ;

    if (isRefresh) {
      setState(() {
        data = result['products']['data'] ;
        hospitalsList = data ;
      });


    } else {
      setState(() {
        refreshController.loadNoData();
        data = result['products']['data'];
        for(int i = 0 ; i < data.length ; i++)
        {
          hospitalsList.add(data[i]) ;
        }
      }
      );
    }
    currentPage++;
    totalPages = result['products']['last_page'];

    return true;
  }

  var _isLodingDelete = false ;


  _deleteProductData(product_id)async
  {
    setState(() {
      _isLodingDelete = true ;
    });
    var result = await deleteProductData(product_id);

    setState(() {
      _isLodingDelete = false ;
    });
  }


  _addProductToMazadData(product_id)async
  {

    var result = await addProductToMazadData(product_id,myController_date.text,myController_initial.text);


  }

  final myController_initial = TextEditingController();
  final myController_date = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  addtoMazadButton(product_id)
  {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return Container(
            height:Get.height / 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(

                          controller: myController_initial,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            return null;
                          },
                          onSaved: (v){},
                          isPassword: false,
                          screenWidth: Get.width,
                          fillColor: AppColors.darkGrey,
                          textInputType: TextInputType.datetime,
                          hintText: 'Initial Price ',
                        ),
                        SizedBox(height: 20),

                        CustomTextFormField(
                          controller: myController_date,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            return null;
                          },
                          onSaved: (v){},
                          isPassword: false,
                          screenWidth: Get.width,
                          fillColor: AppColors.darkGrey,
                          textInputType: TextInputType.datetime,
                          hintText: 'Expire Date ex: 2023-02-25',
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        //   child: Container(
                        //     height: 60,
                        //     width: Get.width,
                        //     decoration: BoxDecoration(
                        //       color:  AppColors.darkGrey,
                        //         border: Border.all(color: Colors.blueGrey, width: 0.0),
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         SizedBox(width: 10,),
                        //         Text('Expire Date',
                        //           style: TextStyle(color: Colors.white),),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  AppButton.normalButton(title: 'Add To Mazad',
                      height: 50,
                      width: Get.width / 1.4,
                      onPress: (){
                        if(_formKey.currentState!.validate())
                        {
                          _addProductToMazadData(product_id);
                          Get.offAll(BottomNavPage(0));
                        }
                      }
                  ),
                ],
              ),
            ),
          );
        });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(

                    child: Icon(
                        Icons.arrow_back_ios
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Text('My Product',style:TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  )),
                  SizedBox(width: 25,)
                ],
              ),
            ),
            Container(
              height: Get.height - 135,
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await _getDoctorData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await _getDoctorData(isRefresh: false);
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child:
                hospitalsList.length == 0 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('There is no data to display',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                      maxLines: 2,
                    )
                  ],
                ) :
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: hospitalsList.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: .7,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                height:240,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      AppButton.normalButton(title: 'Add To Mazad',
                                          height: 50,
                                          width: Get.width / 1.4,
                                          onPress: (){
                                          Get.back();
                                          addtoMazadButton(hospitalsList[index]['id']);
                                          }
                                      ),
                                      AppButton.normalButton(title: 'Delete',
                                          height: 50,
                                          width: Get.width / 1.4,
                                          backgroundColor: Colors.redAccent,
                                          onPress: (){
                                            _deleteProductData(hospitalsList[index]['id']);
                                            setState(() {
                                              refreshController.requestRefresh();
                                            });
                                            Get.back();
                                          }
                                      ),
                                      SizedBox(height: 50,)
                                    ],
                                  ),
                                ),
                              );
                            });
                        },
                      child: Card(
                        elevation: .7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipPath(
                                clipper: MyClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(hospitalsList[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(hospitalsList[index]['title'],style: TextStyle(fontSize: 15)),
                                          Text(
                                            hospitalsList[index]['price'].toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
            ),
          ],
        ),
      ),
    );
  }
}