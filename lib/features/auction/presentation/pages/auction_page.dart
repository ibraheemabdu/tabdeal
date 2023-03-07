import 'package:done_deal/features/auction/data/datasources/api.dart';
import 'package:done_deal/features/auction/presentation/pages/finish_view.dart';
import 'package:done_deal/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../app/app_consts.dart';
import '../../../../app_buttons.dart';
import '../../../../components/category_list.dart';
import '../../../../components/category_title.dart';
import '../../../../components/feed_news.dart';
import '../../../../components/popular_list.dart';
import '../../../../components/search_bar.dart';
import '../../../../models/popular_model.dart';

class AuctionPage extends StatefulWidget {

   var popularModel;

  AuctionPage(this.popularModel);
  @override
  _AuctionPageState createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {


  final myController_price = TextEditingController();
  _makeAuctionData(product_id)
  {
    makeAuctionData(product_id, myController_price.text);
  }
  final _formKey = GlobalKey<FormState>();
  String image = '';
  @override
  void initState() {
    // TODO: implement initState

    if(widget.popularModel['product_images'].length > 0)
    {
      image = widget.popularModel['product_images'][0]['image'].toString() ;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                  child: Container(
                    height: 350,
                    width: Get.width - 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 15,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 15,
                  child: Container(
                    width: 70,
                    height: 250,
                    child: ListView.builder(
                      itemBuilder: (context, index) {

                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  image = widget.popularModel['product_images'][index]['image'];
                                });
                              },
                              child: Container(
                                height: 70,
                                width: 70,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.darkGrey,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.network(widget.popularModel['product_images'][index]['image']),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],
                        );
                      },
                      itemCount: widget.popularModel['product_images'].length,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.popularModel['title'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        widget.popularModel['price'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Divider(color: Colors.black),
                Text(
                  'Bid Information',
                  style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Expire Date :',
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.popularModel['product_auction']['expire_date'],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      'Current Bid :',
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.popularModel['product_auction']['max_price'],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Initial Price :',
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.popularModel['product_auction']['start_of'],
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 35),

                Divider(color: Colors.black),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: myController_price,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Bid Value",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33.0)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),


        ],
      ),

      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: AppColors.lightGrey, blurRadius: 20),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.normalButton(title: 'Bid Now',
                height: 50,
                width: Get.width / 1.4,
                onPress: (){
                  if(_formKey.currentState!.validate())
                  {
                    _makeAuctionData(widget.popularModel['id']);
                    Get.offAll(BottomNavPage(0));
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}

