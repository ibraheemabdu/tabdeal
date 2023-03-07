import 'package:done_deal/features/account/presentation/pages/account_page.dart';
import 'package:done_deal/features/explore/presentation/pages/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_consts.dart';
import '../../../../app/helper_clasess/var.dart';
import '../../../add_product/presentation/pages/add_product_page.dart';



class BottomNavPage extends StatefulWidget {
  var _selectedPageIndex = 0;


  BottomNavPage(this._selectedPageIndex);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late List<Widget> pages;
  late PageController _pageController;


  void _onItemTapped(int index) {
    setState(() {
      widget._selectedPageIndex  = index;
      _pageController.jumpToPage(widget._selectedPageIndex );
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = <Widget>[
      ExplorePage(),
      AddProductPage(),
      AccountPage(),

    ];
    AppDataModel appDataModel = Get.put(AppDataModel(),);

    _pageController = PageController(initialPage: widget._selectedPageIndex);
  }



  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: AppColors.darkGrey),
            icon: Icon(Icons.home,color: Colors.black45),
              label: '',
              tooltip: 'Home'
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.add_box_outlined,color:AppColors.darkGrey),
            icon: Icon(Icons.add_box_outlined,color: Colors.black45),
            label: '',

              tooltip: 'Home'
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person,color:AppColors.darkGrey),
            icon: Icon(Icons.person,color: Colors.black45),
            label: '',

              tooltip: 'Home'
          ),
        ],
        selectedItemColor: Get.theme.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}