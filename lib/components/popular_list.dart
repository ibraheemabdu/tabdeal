
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app/app_consts.dart';
import '../dummy_data.dart';
import '../features/product_details/presentation/pages/product_details_page.dart';
import 'package:get/get.dart';
class HomePopularList extends StatefulWidget {
  var data ;


  HomePopularList(this.data);

  @override
  State<HomePopularList> createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        itemCount: widget.data.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: .7,
          crossAxisCount: 2,
        ),

      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Get.to(ProductDetailsPage(
            widget.data[index],
          )),
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
                          image: NetworkImage(widget.data[index]['image']),
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
                              Text(widget.data[index]['title'],style: TextStyle(fontSize: 15)),
                              Text(
                               widget.data[index]['price'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       'assets/svg/shirt.svg',
                      //       height: 24,
                      //       width: 24,
                      //       color: AppColors.grey,
                      //     ),
                      //     SizedBox(width: 5,),
                      //     SvgPicture.asset(
                      //       'assets/svg/dress.svg',
                      //       height: 24,
                      //       width: 24,
                      //       color: AppColors.grey,
                      //     ),
                      //     SizedBox(width: 5,),
                      //     SvgPicture.asset(
                      //       'assets/svg/jeans.svg',
                      //       height: 24,
                      //       width: 24,
                      //       color: AppColors.grey,
                      //     ),
                      //     SizedBox(width: 5,),
                      //     SvgPicture.asset(
                      //       'assets/svg/shoes.svg',
                      //       height: 24,
                      //       width: 24,
                      //       color: AppColors.grey,
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
