import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;

import '../../../../app/helper_clasess/shared_preferences_helper.dart';
import '../../../../app/helper_clasess/var.dart';



getMyProductData(lang, currentPage) async {
  var _headers =  {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'lang':Get.deviceLocale.toString(),
  };
  String token='';
  token  = await Utilities.getToken();
  _headers['Authorization'] = 'Bearer $token' ;
  final Uri uri = Uri.parse(
      "https://tab-deal.com/api/customer/customerProducts?page=$currentPage");
  final response = await http.post(uri,
      headers: _headers ,
      body: jsonEncode(
          {
            'api_password':PublicVariables.api_password,
            'device_id':await PublicVariables.getId(),
            'lang':lang
          })
  ).timeout( Duration(seconds: 15));

  return jsonDecode(response.body);


}