import 'dart:io';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/var.dart';

getHomeData() async {
  final data = await  NetworkHelper.post(
    url:'api/home/homePageData',
    deCoded: true,
    body: {
      'lang':'en',
      'api_password': PublicVariables.api_password ,
      'device_id':await PublicVariables.getId(),
    },
    headers: {
    },
    withAuthToken: true,
  );


  return data['data'] ;
}


