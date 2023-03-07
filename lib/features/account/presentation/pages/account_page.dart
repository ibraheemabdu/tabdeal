import 'package:done_deal/app/app_consts.dart';
import 'package:done_deal/app/custom_text_form_field.dart';
import 'package:done_deal/features/my_product/presentation/pages/my_product_page.dart';
import 'package:done_deal/features/wish_list/presentation/pages/wish_list_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app_buttons.dart';
import '../../../../components/popular_list.dart';
import '../../../authen/presentation/pages/authen_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var prefs;
  logout() async {
    prefs.clear();
  }

  shpref() async {
    prefs = await SharedPreferences.getInstance();
    print('asfdadsffas');
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Account',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.notifications_sharp,
                  size: 25,
                  color: Colors.black,
                ),
                const Positioned(
                  bottom: 32,
                  right: -3,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: FutureBuilder(
            future: shpref(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Container(
                    height: Get.width,
                    width: Get.width,
                    color: Colors.black,
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView(
                    children: [
                      SizedBox(height: 5),
                      Align(
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Expanded(
                            child: ClipPath(
                              clipper: MyClipper(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: data.getString('image') != '' ?
                                  DecorationImage(
                                    image:  NetworkImage(
                                        data.getString('image').toString()),
                                    fit: BoxFit.cover,
                                  ):
                                  DecorationImage(
                                    image: AssetImage(
                                        'assets/pictures/background_vector.jpg'),
                                    fit: BoxFit.cover,
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  data.getString('first_name').toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.getString('last_name').toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.getString('phone').toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            AppButton.normalButton(
                                title: 'Edit Profile', height: 45, width: 100)
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: AppColors.darkGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Ads',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Product',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Credits',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(15)),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(WishListPage());
                                  },
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.lightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Icon(Icons.favorite),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Favorite Product',
                                            style: TextStyle(
                                                color: AppColors.lightGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(MyProductPage());
                                  },
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.lightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Icon(Icons.card_giftcard),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'My Product',
                                            style: TextStyle(
                                                color: AppColors.lightGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(Icons.language),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Language',
                                          style: TextStyle(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.lightGrey,
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(15)),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                              Icons.contact_support_rounded),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Contaxt Us',
                                          style: TextStyle(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.lightGrey,
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(Icons.priority_high),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'About Us',
                                          style: TextStyle(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.lightGrey,
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(Icons.report_problem),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Report Problem',
                                          style: TextStyle(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.lightGrey,
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(15)),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await logout();
                                    Get.offAll(AuthenPage());
                                  },
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.lightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Icon(Icons.logout),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Log Out',
                                            style: TextStyle(
                                                color: AppColors.lightGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Container(
                      height: Get.width,
                      width: Get.width,
                      color: Colors.red,
                    ),
                  );
                }
              } else {
                return Center(
                  child: Container(
                    height: Get.width,
                    width: Get.width,
                    color: Colors.blue,
                  ),
                );
              }
            }));
  }
}
