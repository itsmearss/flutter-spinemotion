import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'article_provider.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart' as lipsum;
import 'package:spinemotion_app/pages/articlepage/article_list.dart';
import 'package:spinemotion_app/pages/articlepage/details.dart';
import 'package:spinemotion_app/pages/articlepage/widgets/article_widgets.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(216, 228, 232, 1),
      body: listArticle(),
    );
  }

  Widget listArticle() {
    List<ListItem> listTiles = [
      ListItem(
          'https://res.cloudinary.com/dpm5irq1n/image/upload/v1718961259/article/l1kguxnzr3l1osrsxmef.png',
          'Kebiasaan Buruk Pemicu Kifosis yang Harus Dihindari',
          'Kifosis merupakan kondisi kelainan di lengkungan tulang belakang.',
          "20 Juli 2024"),
      ListItem(
          'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719015868/article/vlchuaorddxxfpdood09.png',
          'Alat Terapi Koreksi Postur Tulang Efektif?',
          'Postur tubuh yang salah dapat menyebabkan terjadinya kelainan bentuk tulang belakang. ',
          "20 Juli 2024"),
      ListItem(
          'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719016127/article/umbi9alundcrzavbjj6c.png',
          'Gerakan Pencegahan Kifosis',
          'Kamu bisa melakukan gerakan-gerakan senam di bawah ini untuk menyembuhkan kifosis ',
          "20 Juli 2024"),
      ListItem(
          'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719019031/article/r9u209zfeorr9jrtkdds.png',
          'Makanan yang Wajib Dikonsumsi untuk Pencegahan Kifosis',
          lipsum.loremIpsum(words: 15),
          "20 Juli 2024"),
    ];
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          mainSlide(),
          Container(
            color: Color.fromRGBO(216, 228, 232, 1),
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.black,
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Text(
                      "Top",
                      style: TextStyle(fontSize: 14.sp),
                    )),
                    Tab(
                        child: Text(
                      "Popular",
                      style: TextStyle(fontSize: 14.sp),
                    )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      child: ListView.builder(
                    itemCount: listTiles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        item: listTiles[index],
                                        tag: listTiles[index].newsTitle,
                                        key: null,
                                      )));
                        },
                        child: listWidget(listTiles[index]),
                      );
                    },
                  )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(child: Text('Popular Articles')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainSlide() {
    final List<String> imgList = [
      'https://res.cloudinary.com/dpm5irq1n/image/upload/v1718961259/article/l1kguxnzr3l1osrsxmef.png',
      'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719015868/article/vlchuaorddxxfpdood09.png',
      'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719016127/article/umbi9alundcrzavbjj6c.png',
      'https://res.cloudinary.com/dpm5irq1n/image/upload/v1719019031/article/r9u209zfeorr9jrtkdds.png',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final CarouselController _controller = CarouselController();

    return Column(
      children: [
        Consumer<PageIndexNotifier>(
          builder: (context, pageIndexNotifier, child) {
            return CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blueAccent,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item,
                                    fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      'No. ${imgList.indexOf(item)} image',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  pageIndexNotifier.setIndex(index);
                },
              ),
            );
          },
        ),
        SizedBox(height: 20.0),
        Consumer<PageIndexNotifier>(
          builder: (context, pageIndexNotifier, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Color.fromRGBO(59, 120, 138, 0.6))
                          .withOpacity(
                              pageIndexNotifier.currentIndex == entry.key
                                  ? 0.9
                                  : 0.4),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
