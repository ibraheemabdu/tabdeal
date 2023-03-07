import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../data/datasources/api.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final myController_phone = TextEditingController();
  final myController_pass = TextEditingController();
  final myController_fname = TextEditingController();
  final myController_lname = TextEditingController();
  final myController_cpass = TextEditingController();
  bool hidepass = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false ;
  String phone = '';



  _logInData()
  async{
    setState(() {
      _isLoading = true ;
    });
    var result = await signUpData(
      first_name: myController_fname.text,
      last_name: myController_lname.text,
      phone:phone,
      password: myController_pass.text,
      password_confirmation: myController_cpass.text
    );
    setState(() {
      _isLoading = false ;
    });
    print('resultresultresultresultresultresultresultresult');
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
                    'Sign Up',
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
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: myController_fname,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "First Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33.0)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: myController_lname,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33.0)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: hidepass,
                          controller: myController_cpass,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Field';
                            }
                            if (value != myController_pass.text) {
                              return ''' Password Doesn't Match ''';
                            }
                            return null;

                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(33.0)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hidepass = hidepass;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
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
                      if (_formKey.currentState!.validate() ) {
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
                // UIHelper.verticalSpaceMedium,
                // _buildBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}