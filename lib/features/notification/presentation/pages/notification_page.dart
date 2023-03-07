import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/app/custom_text_form_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../app_buttons.dart';
import '../../../../components/popular_list.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<NotificationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:Text(
          'Notification',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8 , top: 8 , right: 8),
            child: Text('Today',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(15)
              ),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.access_time_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 1,color: AppColors.lightGrey,),
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.add_alert_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),


                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8 , top: 8 , right: 8),
            child: Text('15/2/2022',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(15)
              ),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.access_time_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 1,color: AppColors.lightGrey,),
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.add_alert_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 1,color: AppColors.lightGrey,),
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.access_time_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 1,color: AppColors.lightGrey,),
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.add_alert_outlined),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Product in Way',
                          style: TextStyle(color: AppColors.lightGrey,fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
