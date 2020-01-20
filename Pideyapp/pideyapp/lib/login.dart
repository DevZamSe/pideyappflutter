import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget implements State <CarouselSlider> {
  
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80',
    'https://images.unsplash.com/photo-1506084868230-bb9d95c24759?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              CarouselSlider(
                height: 390.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                onPageChanged: (index){
                  setState((){ 
                    _current = index;
                  });
                },
                items: imgList.map((imgUrl){
                  return Builder(
                    builder: (BuildContext context){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.orange
                        ),
                        child: Image.network(imgUrl, fit: BoxFit.fill),
                      );
                    },
                  );
                }).toList(),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/logo.png', width: 55.0,)
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[  
                        Text('PideYapp', 
                          style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Quicksand'),
                          textAlign: TextAlign.left,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Widget makeItem({image}) {
  return AspectRatio(
    aspectRatio: 1/1,
    child: Container(
      margin: EdgeInsets.only(left: 5, right: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
    ),
  );
}