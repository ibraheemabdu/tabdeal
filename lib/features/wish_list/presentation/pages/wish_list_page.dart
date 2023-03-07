import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/popular_list.dart';

class WishListPage extends StatelessWidget {
  // getProductWishlists()async
  // {
  //   return await getProductWishlistsdata() ;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios,color: Colors.black)),
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Wish List',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: SafeArea(
      //   top: true,
      //   child:
      //   //HomePopularList(),
      // ),
    );
  }
}
