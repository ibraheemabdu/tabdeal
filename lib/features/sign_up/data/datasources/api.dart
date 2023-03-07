import 'dart:io';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/custom_snackbar.dart';
import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/var.dart';







  signUpData({phone, password, password_confirmation, first_name, last_name}) async {

    final data = await NetworkHelper.post(
      url: 'api/register',
      deCoded: true,
      body: {
        'first_name':first_name,
        'last_name':last_name,
        'phone':phone,
        'password':password,
        'password_confirmation':password_confirmation,
        'lang':'en',
        'api_password': PublicVariables.api_password ,
        'device_id':await PublicVariables.getId(),
      },
      headers: {},
      withAuthToken: true,
    );




    print('data');
    print(data);

    customSnackBarWidget(data);
  if(data['status'] == true)
  {
    _saveToken(data);
  }

  return data;
}







_saveToken(data) async
{
  final prefs = await SharedPreferences.getInstance() ;
  await prefs.setString('token', data['access_token']);
  await prefs.setString('first_name', data['user']['first_name']);
  await prefs.setString('last_name', data['user']['last_name']);
  await prefs.setString('phone', data['user']['phone']);
  await prefs.setString('image', data['user']['profile_photo_path']);
}