import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../data/datasources/api.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final myController_email = TextEditingController();
  final myController_pass = TextEditingController();
  bool hidepass = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false ;
  String phone = '' ;

  _logInData()
  async{
    setState(() {
      _isLoading = true ;
    });
    var result = await loginData(phone: phone,password:  myController_pass.text);

    setState(() {
      _isLoading = false ;
    });

    print(result);
    if(result['status'] == true)
      {
        Get.offAll(BottomNavPage(0));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 38,
                  ),
                  onPressed: () {
                   Get.back();
                  },
                ),

                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                      style:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.w900)
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[

                        IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: "Phone",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(33.0)),
                          ),
                          initialCountryCode: 'JO',
                          onChanged: (phone) {},
                          validator: (value) {
                            if (value == null) {
                              return 'Required Field';
                            }
                            phone = value.completeNumber;
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: hidepass,
                          controller: myController_pass,
                          textInputAction: TextInputAction.next,
                          validator: (value) {

                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33.0)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hidepass = !hidepass;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //    // Get.to(ForgotPasswordPage());
                        //   },
                        //   child: Container(
                        //       width: Get.width,
                        //       child: Text(
                        //         'Forgot your password?',
                        //         textAlign: TextAlign.end,
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(16),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _logInData();
                      }
                    },
                    color: AppColors.darkGrey,
                    textColor: Colors.white,
                    child:_isLoading
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.arrow_forward,
                      size: 32,
                    ),
                    padding: EdgeInsets.all(24),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}