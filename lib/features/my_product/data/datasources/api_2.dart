import 'dart:io';
import 'package:done_deal/app/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/var.dart';

deleteProductData(product_id) async {
  final data = await  NetworkHelper.post(
    url:'api/customer/deleteProduct',
    deCoded: true,
    body: {
      'lang':'en',
      'api_password': PublicVariables.api_password ,
      'device_id':await PublicVariables.getId(),
      'product_id':product_id
    },
    headers: {
    },
    withAuthToken: true,
  );
  return data ;
}


addProductToMazadData(product_id,expire_date,start_of) async {
  final data = await  NetworkHelper.post(
    url:'api/customer/addProductAuction',
    deCoded: true,
    body: {
      'lang':'en',
      'api_password': PublicVariables.api_password ,
      'device_id':await PublicVariables.getId(),
      'expire_date':expire_date,
      'start_of':start_of,
      'product_id':product_id
    },
    headers: {
    },
    withAuthToken: true,
  );


  customSnackBarWidget(data);
  return data ;
}


