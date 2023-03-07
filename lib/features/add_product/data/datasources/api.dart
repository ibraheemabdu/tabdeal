import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:done_deal/app/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';



import '../../../../app/helper_clasess/network_helper.dart';
import '../../../../app/helper_clasess/shared_preferences_helper.dart';
import '../../../../app/helper_clasess/var.dart';
import 'package:get/get.dart';

  addProductsData({photo,name,subCategory,price,description,isMazad}) async {


    // List<String> image = [] ;
    // for(int i = 0 ; i < photo.length ; i ++)
    //   {
    //     final bytes = File(photo[i].path).readAsBytesSync();
    //     String base64Image =  "data:image/png;base64,"+base64Encode(bytes);
    //
    //     image.add(base64Image);
    //   }







    final uri = Uri.https('tab-deal.com','api/customer/addProduct');
    var request =  http.MultipartRequest('POST', uri);

    List<http.MultipartFile> image = [] ;
    var httpImage ;
    print('tet 0');




    // for (var i = 0; i < photo.length; i++) {
    //   request.files.add(http.MultipartFile('image',
    //       File(photo[i].path).readAsBytes().asStream(),
    //       File(photo[i].path).lengthSync(),
    //       filename: basename('image')));
    // }


      for(int i = 0 ; i < photo.length ; i ++)
    {


       httpImage = await http.MultipartFile.fromPath(
         'image[]',
         photo[i].path,
       );
       request.files.add(await httpImage);

       //image.add(await httpImage);
    }
    print('tet 1');
    var _headers =  {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang':Get.deviceLocale.toString(),
    };
    var token  = await Utilities.getToken();
    _headers['Authorization'] = 'Bearer $token' ;
   // request.files.addAll(await image);
    request.fields['lang'] = 'en' ;
    request.fields['api_password'] = PublicVariables.api_password ;
    request.fields['device_id'] = await PublicVariables.getId() ;
    request.fields['description'] = description ;
    request.fields['title'] = name ;
    request.fields['category_id'] = subCategory.toString() ;
    request.fields['price'] = price ;



    print(request);
    request.headers.addAll(_headers);

    try
    {
      print('a000');
      final stresponse = await request.send();

      print('a1111');
      final response = await http.Response.fromStream(stresponse);

      print('a2222');
      if(response.statusCode != 200)
        {
          print('a33333');
          print(response.statusCode);
          print(response.body);
          return null ;
        }
      print('json.decode(response.body)');
      print(json.decode(response.body).toString());

      customSnackBarWidget(json.decode(response.body));

      return json.decode(response.body);

    }
    catch(e)
    {
      print('aasdfasdfasfdfas');
    };
}


