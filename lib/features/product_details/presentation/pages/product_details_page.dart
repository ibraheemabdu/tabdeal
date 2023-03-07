import 'package:done_deal/app/app_dimensions.dart';
import 'package:done_deal/app/custom_text_form_field.dart';
import 'package:done_deal/features/auction/presentation/pages/auction_page.dart';
import 'package:done_deal/features/swap/presentation/pages/swap_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/app_consts.dart';
import '../../../../app_buttons.dart';
import '../../../../components/category_list.dart';
import '../../../../components/category_title.dart';
import '../../../../components/feed_news.dart';
import '../../../../components/popular_list.dart';
import '../../../../components/search_bar.dart';
import '../../../../models/popular_model.dart';
import '../../../../select_size.dart';

class ProductDetailsPage extends StatefulWidget {
  var popularModel;

  ProductDetailsPage(this.popularModel);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {


  String image = '';
  var _contact = -1 ;
  @override
  void initState() {

    if(widget.popularModel['product_images'].length > 0)
      {
        image = widget.popularModel['product_images'][0]['image'].toString() ;
      }
    super.initState();
  }
  int currentIndex = 0;


  Future<void> _dialCall(phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone.toString(),
    );
    print('object');
    print(phone);
    await launch(launchUri.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                  child: Container(
                    height: 350,
                    width: Get.width ,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (i) {
                        setState(() => currentIndex = i);
                      },
                      itemCount:  widget.popularModel['product_images'].length,
                      itemBuilder: (ctx, i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:  NetworkImage(widget.popularModel['product_images'][i]['image'].toString()),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(

                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
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
                ),

                Positioned(
                  right: 30,
                  bottom: 10,
                  child: SizedBox(
                    height: 16,
                    child: Row(
                      children: List.generate(
                        widget.popularModel['product_images'].length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 3),
                          height: index == currentIndex ? 16 : 8,
                          width: 5,
                          decoration: BoxDecoration(
                            color:
                            index == currentIndex ? Colors.white : AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.popularModel['title'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\$${widget.popularModel['price']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.favorite_border_outlined),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.popularModel['product_customer']['profile_photo_path'].toString()),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(color: AppColors.grey, blurRadius: 8),
                  ],
                ),
              ),
              title: Row(
                children: [
                   Text(
                     widget.popularModel['product_customer']['first_name'].toString() + ' ' +widget.popularModel['product_customer']['last_name'].toString() ,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                   SizedBox(width: 15),
                  SvgPicture.network(
                    'assets/svg/verified.svg',
                    height: 18,
                    width: 18,
                  ),
                ],
              ),
              subtitle:  Text('Personal'),
            ),
            const SizedBox(height: 10),

            _contact == 1   ? Container() :Expanded(
              child: InkWell(
                onTap: () {
                  setState((){
                    _contact = 1 ;
                  });

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                  ),
                  child: Center(
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.w22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _contact == 1 ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _dialCall(widget.popularModel['product_customer']['phone']);
                      //  widget.popularModel['product_customer']['phone'];
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                      ),
                      child: Center(
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.w22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      await launch (
                          "https://wa.me/${widget.popularModel['product_customer']['phone']}?text=${widget.popularModel['title'].toString()}");
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Whatsapp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.w22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ) : Container(),



            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Preferably Exchange it with',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            const DetailScreenSelectSize(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.popularModel['description'],
                style: const TextStyle(color: AppColors.grey),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
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
          children: [



            widget.popularModel['product_auction'].toString() != 'null' ?
            Expanded(child:

            InkWell(
              onTap: () {
                Get.to(AuctionPage(widget.popularModel));
              },
              child: Container(
                color: AppColors.darkGrey,
                height: 50,
                child: Center(
                  child: Text('Mazad',style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,)),
                ),
              ),
            )):Container(),
            Container(
              color: Colors.white,
              height: 50,
              width: 0.6,
            ),
            Expanded(
              child:
            InkWell(
              onTap: () {
                Get.to(SwapPage(widget.popularModel));
              },
              child: Container(
                color: AppColors.darkGrey,
                height: 50,
                child: Center(
                  child: Text('TabDeal',style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,)),
                ),
              ),
            ),
            ),


            // AppButton.normalButton(title: 'Order Now',
            //     height: 50,
            //     width: Get.width / 1.4,
            //   onPress: (){
            //     showModalBottomSheet(
            //         context: context,
            //         isScrollControlled: true,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(25.0),
            //             topRight: Radius.circular(25.0),
            //           ),
            //         ),
            //         builder: (context) {
            //           return Container(
            //             height:240,
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   // AppButton.normalButton(title: 'Buy',
            //                   //   height: 50,
            //                   //   width: Get.width / 1.4,
            //                   // onPress: (){
            //                   //
            //                   // }
            //                   // ),
            //                   widget.popularModel['product_auction'].toString() != 'null' ?
            //                   AppButton.normalButton(title: 'Mazad',
            //                     height: 50,
            //                     width: Get.width / 1.4,
            //                       onPress: (){
            //                     Get.to(AuctionPage(widget.popularModel));
            //                       }
            //                       ):Container(),
            //
            //
            //
            //                   AppButton.normalButton(title: 'TabDeal',
            //                     height: 50,
            //                     width: Get.width / 1.4,
            //                       onPress: (){
            //                         Get.to(SwapPage(widget.popularModel));
            //                       }
            //                       ),
            //                   SizedBox(height: 50,)
            //                 ],
            //               ),
            //             ),
            //           );
            //         }
            //         );
            //   }
            // ),
          ],
        ),
      ),
    );
  }
}
