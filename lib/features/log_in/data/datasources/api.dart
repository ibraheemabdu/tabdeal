import 'dart:io';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/custom_snackbar.dart';
import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/var.dart';


  loginData({phone, password}) async {
    final data = await NetworkHelper.post(
      url: 'api/login',
      deCoded: true,
      body: {
        'phone':phone,
        'password':password,
        'lang':'en',
        'api_password': PublicVariables.api_password ,
        'device_id':await PublicVariables.getId(),
      },
      headers: {},
      withAuthToken: true,
    );

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