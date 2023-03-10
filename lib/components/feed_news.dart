

import 'package:flutter/material.dart';

import '../app/app_consts.dart';
import '../app_buttons.dart';

class FeedNews extends StatefulWidget {
  var data ;
  FeedNews(this.data);

  @override
  State<FeedNews> createState() => _FeedNewsState();
}

class _FeedNewsState extends State<FeedNews> {



  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    return widget.data.length == 0 ? Container() : Stack(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) {
              setState(() => currentIndex = i);
            },
            itemCount: widget.data.length,
            itemBuilder: (ctx, i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:  NetworkImage(widget.data[i]['image']),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.6),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 35,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white24,
                    ),
                    child:  Text(
                      widget.data[i]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              widget.data[i]['description'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
                widget.data.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 3),
                  height: index == currentIndex ? 16 : 8,
                  width: 5,
                  decoration: BoxDecoration(
                    color:
                        index == currentIndex ? Colors.white : AppColors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
