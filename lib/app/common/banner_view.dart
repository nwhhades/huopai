import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  final List<String> dataList;
  final bool isNetData;
  final double width;

  const BannerView({
    super.key,
    required this.dataList,
    required this.isNetData,
    required this.width,
  });

  @override
  State<StatefulWidget> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  int _currentIndex = 0;
  final _controller = CarouselController();

  Widget createImage(String src) {
    final Image img;
    if (widget.isNetData) {
      img = Image.network(
        src,
        fit: BoxFit.fill,
        width: widget.width,
      );
    } else {
      img = Image.asset(
        src,
        fit: BoxFit.fill,
        width: widget.width,
      );
    }
    return img;
  }

  Widget createDot(int index) {
    return Container(
      width: 60,
      height: 3,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
        color: _currentIndex == index ? Colors.blue : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //创建图片列表
    List<Widget> imgList = List.generate(
        widget.dataList.length, (index) => createImage(widget.dataList[index]));
    //创建指示器列表
    Row indicatorList = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(widget.dataList.length, (index) => createDot(index)),
    );
    //滑动容器
    CarouselSlider carouselSlider = CarouselSlider(
      items: imgList,
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enlargeFactor: 0,
        initialPage: 0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    //层叠容器
    Stack stack = Stack(
      alignment: Alignment.center, // 设置子级小部件的对齐方式
      children: [
        carouselSlider,
        Positioned(
          left: 20,
          child: IconButton(
            onPressed: () {
              _controller.previousPage();
            },
            icon: Image.asset("res/icons/arrows.png"),
          ),
        ),
        Positioned(
          right: 20,
          child: IconButton(
            onPressed: () {
              _controller.nextPage();
            },
            icon: RotatedBox(
              quarterTurns: 2,
              child: Image.asset("res/icons/arrows.png"),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: indicatorList,
        ),
      ],
    );
    return SizedBox(
      width: widget.width,
      child: stack,
    );
  }
}
