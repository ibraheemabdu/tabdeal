import 'dart:io';
import 'package:done_deal/app/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/var.dart';

makeAuctionData(product_id,price) async {
  final data = await  NetworkHelper.post(
    url:'api/customer/makeAuction',
    deCoded: true,
    body: {
      'lang':'en',
      'api_password': PublicVariables.api_password ,
      'device_id':await PublicVariables.getId(),
      'product_id':product_id,
      'price':price
    },
    headers: {
    },
    withAuthToken: true,
  );


  customSnackBarWidget(data);
  print(data);
  return data ;
}


