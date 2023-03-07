import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_buttons.dart';

class FinishSwapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: ()=> Get.offAll(BottomNavPage(0)),
                icon: Icon(
                  Icons.close,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 200,
                    color: AppColors.lightGrey,
                  ),
                  Text('The request has been sent successfully. \n Please wait for the response'
                      ' drom the user. \n You can follow up on the request through the requests page',textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  AppButton.normalButton(title: 'Continue Shopping',
                      height: 50,
                      width: Get.width / 1.4,
                      onPress: (){
                        Get.offAll(BottomNavPage(0));
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}