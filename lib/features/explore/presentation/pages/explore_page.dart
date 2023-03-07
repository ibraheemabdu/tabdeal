import 'package:done_deal/features/explore/data/datasources/api.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../app/helper_clasess/var.dart';
import '../../../../components/category_list.dart';
import '../../../../components/category_title.dart';
import '../../../../components/feed_news.dart';
import '../../../../components/popular_list.dart';
import '../../../../components/search_bar.dart';
import '../../../notification/presentation/pages/notification_page.dart';

class ExplorePage extends StatefulWidget {

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {




  getData()
  {
   return getHomeData();
  }

  AppDataModel appDataModel = Get.find();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          'Done Deal',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   // Stack(
        //   //   clipBehavior: Clip.none,
        //   //   alignment: Alignment.center,
        //   //   children: [
        //   //     InkWell(
        //   //         onTap: (){
        //   //           Get.to(NotificationPage());
        //   //         },
        //   //         child: Icon(Icons.notifications_sharp,size: 25,color: Colors.black,)),
        //   //     const Positioned(
        //   //       bottom: 32,
        //   //       right: -3,
        //   //       child: CircleAvatar(
        //   //         radius: 4,
        //   //         backgroundColor: Colors.red,
        //   //       ),
        //   //     ),
        //   //   ],
        //   // ),
        //   const SizedBox(width: 15),
        // ],
      ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              else if (snapshot.connectionState == ConnectionState.done)
              {
                if (snapshot.hasError) {
                  return Container(
                    height: Get.width,
                    width: Get.width,
                    color: Colors.black,
                  );
                }
                else if (snapshot.hasData) {

                  var data = snapshot.data;
                  appDataModel.cat = data['categories'];
                  return ListView(
                      children: [
                        SizedBox(height: 15),
                        SearchBar(),
                        SizedBox(height: 15),
                        FeedNews(data['banners']),
                        SizedBox(height: 15),
                        HomeCategoryList(data['categories']),
                        SizedBox(height: 15),
                        SizedBox(height: 5),
                       HomePopularList(data['popular_products']),
                      ],
                    );
                }
                else {
                  return Center(
                    child: Container(
                      height: Get.width,
                      width: Get.width,
                      color: Colors.red,
                    ),
                  );
                }
              }
              else {
                return Center(
                  child: Container(
                    height: Get.width,
                    width: Get.width,
                    color: Colors.blue,),
                );
              }
            }
            ),









      ),
    );
  }
}
