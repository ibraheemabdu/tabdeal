import 'dart:io';

import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/app/custom_text_form_field.dart';
import 'package:done_deal/features/add_product/data/datasources/api.dart';
import 'package:done_deal/features/authen/presentation/pages/authen_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/helper_clasess/shared_preferences_helper.dart';
import '../../../../app/helper_clasess/var.dart';
import '../../../../app_buttons.dart';
import '../../../../components/category_list.dart';
import '../../../../components/category_title.dart';
import '../widgets/add_category_list.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {


  final myController_name = TextEditingController();
  final myController_dis = TextEditingController();
  final myController_price = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AppDataModel appDataModel = Get.find();

  List<XFile> listOfImages = [];





   _editProfileImage() async {

    final ImagePicker _picker = ImagePicker();

    final List<XFile>? images = await _picker.pickMultiImage(
      imageQuality: 70,
      maxWidth: 1440,);

    return images ;
  }





  bool isLogIn = true ;

  bool _isLoading = false ;


   getToken()async
   {
     final prefs = await SharedPreferences.getInstance();
     final token = prefs.get('token')??'';

     print('as');
     print(token);
     if(token == '')
     {
       setState(() {
         isLogIn = false ;
       });
     }
     else
     {
       setState(() {
         isLogIn = true ;
       });
     }
   }

   _addproduct()
   async
   {
     setState(() {
       _isLoading = true ;
     });

    await addProductsData(
       photo: listOfImages,
       isMazad: false,
       price: myController_price.text,
       name: myController_name.text,
       description: myController_dis.text,
       subCategory: appDataModel.subCat ,
     );

     setState(() {
       _isLoading = false ;
     });
   }



   @override
  void initState() {
    // TODO: implement initState
     getToken();
     super.initState();
   }






   @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLogIn ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Align(
                child: InkWell(
                  onTap: ()async{
                    listOfImages = await _editProfileImage();
                    print( listOfImages.length);
                      setState(() {
                      });
                  },
                  child: Container(
                    width: Get.width / 2,
                    height: Get.width / 2,
                    decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(
                      child: Image.asset('assets/pictures/camera.png',
                        width: Get.width / 3,
                        height: Get.width / 3,
                        color: Colors.white,
                      ) ,
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: !listOfImages.isEmpty,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Image.file(File(listOfImages[index].path),height: 100,),
                                SizedBox(width: 15,)
                              ],
                            );
                          },
                          itemCount: listOfImages.length,
                        ),
                      )
                    ],
              )
              ),
              SizedBox(height: 15),
              CategoryTitle(title: 'Chose Category',),
              SizedBox(height: 10),

              AddProductCategoryList(appDataModel.cat),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: myController_name,
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
                hintText: 'Name',
              ),
              SizedBox(height: 15),
              CustomTextFormField(validator: (value){},
                onSaved: (value){
                  if (value == null || value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;},
                controller: myController_dis,
                isPassword: false,
                screenWidth: Get.width,
                fillColor: AppColors.darkGrey,
                hintText: 'Description',
                maxLine: 8,
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: myController_price,
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
                hintText: 'Price',
                maxLine: 1,
                textInputType: TextInputType.number,
              )
            ],
          ),
        ),
      )
          :
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.login,
              size: 200,
              color: AppColors.grey,
            ),
            SizedBox(height: 30,),
            AppButton.normalButton(title: 'LogIn',
                height: 50,
                width: Get.width / 1.4,
                onPress: (){
                  Get.offAll(AuthenPage());
                }
            ),
          ],
        ),
      ),

      bottomNavigationBar:isLogIn ?
      Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: AppColors.lightGrey, blurRadius: 20),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:
              (){
                if(_formKey.currentState!.validate() && listOfImages.length > 0 )
                {
                  _addproduct();
                }
              },
              child: Container(
                height: 50,
                width: Get.width / 1.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(color: AppColors.lightGrey, blurRadius: 5),
                  ]
                ),
                child:_isLoading
                    ? CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text(
                  'ADD',
                  style: TextStyle(
                    color:  Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )
          :
      Container(height: 0,),
    );

  }
}