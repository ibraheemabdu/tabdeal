

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class PublicVariables {

  static var api_password = 'ZuExz6iLfzLHsa0pPOimwb4nz9XkTywsyQGoQdORwAdB69zmLdOHKGjOsN4H7Anu';

  static getId() async {
    print('androidDeviceInfo');
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor.toString();
    }
    else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId.toString();
    }
  }
}

// class AppDataModel extends GetxController{
//   var  cartLength = 0.obs ;
//   List<CartItem> cartItem = [];
//   int cartToltalQuantity = 0 ;
//   double cartToltalPrice = 0.0 ;
//   RxString image = 'assets/images/logo.png'.obs ;
//   static int categoryId = 0 ;
//   static String categoryName = '' ;
//   static String categoryImage = '' ;
//   static List<List<int>> filtrdata = [] ;
// }


class AppDataModel extends GetxController{
  List cat  = [];
  int subCat = 0 ;
}