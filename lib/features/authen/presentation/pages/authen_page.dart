import 'package:done_deal/app/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../log_in/presentation/pages/login_page.dart';
import '../../../sign_up/presentation/pages/sign_up_page.dart';

class AuthenPage extends StatefulWidget {

  @override
  _AuthenViewState createState() {
    return _AuthenViewState();
  }
}

class _AuthenViewState extends State<AuthenPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Signupbtn = InkWell(
      onTap: () => Get.to(SignupPage()),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    final Loginbtn = InkWell(
      onTap: () =>  Get.to(LoginView()),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: AppColors.darkGrey,),
          color: AppColors.darkGrey,
        ),
        child: Center(
          child: Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(60),
                //color: Colors.green,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Signupbtn,
                    SizedBox(height: 30),
                    Loginbtn,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}