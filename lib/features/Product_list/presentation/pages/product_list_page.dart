import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../app/app_consts.dart';
import '../../../../components/popular_list.dart';
import '../../../../dummy_data.dart';
import '../../../product_details/presentation/pages/product_details_page.dart';
import '../../data/datasources/api.dart';


class ProductList extends StatefulWidget {
  var supId ;

  ProductList(this.supId);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int currentPage = 1;

  late int totalPages = 0;

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  var data ;
  List hospitalsList = [];

  Future<bool> _getDoctorData({bool isRefresh = false}) async {


    var result = await getProductData('en', currentPage,widget.supId) ;

    if (isRefresh) {
      setState(() {
        data = result['products']['data'] ;
        hospitalsList = data ;
      });


    } else {
        setState(() {
          refreshController.loadNoData();
          data = result['products']['data'];
          for(int i = 0 ; i < data.length ; i++)
          {
            hospitalsList.add(data[i]) ;
          }
        }
        );
    }
    currentPage++;
    totalPages = result['products']['last_page'];

    return true;
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(

                    child: Icon(
                        Icons.arrow_back_ios
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Text('Product List',style:TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  )),
                  SizedBox(width: 25,)
                ],
              ),
            ),
            Container(
              height: Get.height - 135,
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await _getDoctorData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await _getDoctorData(isRefresh: false);
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                  },
                child:
                hospitalsList.length == 0 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('There is no data to display',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    )
                  ],
                ) :
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: hospitalsList.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: .7,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Get.to(ProductDetailsPage(hospitalsList[index])),
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
                                      image: NetworkImage(hospitalsList[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(hospitalsList[index]['title'],style: TextStyle(fontSize: 15)),
                                          Text(
                                            hospitalsList[index]['price'].toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}