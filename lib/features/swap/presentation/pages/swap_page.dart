import 'package:done_deal/features/auction/presentation/pages/finish_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_consts.dart';
import '../../../../app_buttons.dart';
import '../../../../components/category_list.dart';
import '../../../../components/category_title.dart';
import '../../../../components/feed_news.dart';
import '../../../../components/popular_list.dart';
import '../../../../components/search_bar.dart';
import '../../../../dummy_data.dart';
import '../../../../models/popular_model.dart';
import 'finish_swap_view.dart';

class SwapPage extends StatefulWidget {

  final PopularModel popularModel;

  SwapPage(this.popularModel);
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {

  String image = '';
  @override
  void initState() {
    // TODO: implement initState
    image = widget.popularModel.picture ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
                          image: AssetImage(image),
                          fit: BoxFit.cover,
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
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = 'assets/pictures/phone1.jpeg';
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
                                child: Image.asset('assets/pictures/phone1.jpeg'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = 'assets/pictures/phone2.jpeg';
                              });
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset('assets/pictures/phone2.jpeg'),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = 'assets/pictures/phone3.jpeg';
                              });
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset('assets/pictures/phone3.jpeg'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/pictures/phone3.jpeg'),
                                fit: BoxFit.scaleDown,
                              ),
                              border: Border.all(
                                color: AppColors.darkGrey,
                                width: 2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/pictures/phone3.jpeg'),
                                fit: BoxFit.scaleDown,
                              ),
                              border: Border.all(
                                color: AppColors.darkGrey,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.popularModel.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$${widget.popularModel.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Swap With',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 15),
            GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(

          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: .7,
          crossAxisCount: 2,
        ),

        itemBuilder: (BuildContext context, int index) {
          return Item(index);

        },
      ),

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AppButton.normalButton(title: 'Swap Now',
                height: 50,
                width: Get.width / 1.4,
                onPress: (){
              Get.to(
                  FinishSwapView());
                }
            ),
          ],
        ),
      ),
    );
  }
}


class Item extends StatefulWidget {
  var index ;

  Item(this.index);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  BoxDecoration _boxDecoration = BoxDecoration();
  bool _isSelected = false ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_isSelected)
            {
              _boxDecoration = BoxDecoration();
              _isSelected = false ;
            }
          else
            {
              _boxDecoration = BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black,
                      width: 1
                  )
              );
              _isSelected = true ;

            }

        });

      },
      child: Container(
        decoration: _boxDecoration,
        child: Card(
          elevation: .7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(popularList[widget.index].picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Text(popularList[widget.index].title,style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


