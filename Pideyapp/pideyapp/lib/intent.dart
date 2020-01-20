import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slider_button/slider_button.dart';

import 'menu.dart';

class Bienvenido extends StatelessWidget implements State<CarouselSlider>{

  bool _sel = false;
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
                      Image.asset('images/logo.png', width: 55.0)
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                    Text('PIDEYAPP', style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                    Text('by Novum Inventia', style: TextStyle(fontSize: 15.0, color: Colors.black),)
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: <Widget>[
                      Center(child: SliderButton(
                        width: 330.0,
                        height: 50.0,
                        action: () {
                          ///Do something here
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> ComoLlamas())
                          );
                        },
                        label: Text(
                            "Desliza para iniciar sesión",
                            style: TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        icon: Icon(Icons.check, color: Colors.white, size: 44.0,)
                        )
                      )
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Row(children: <Widget>[Text('Iniciar Sesión')],),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> BottomNavBar())
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Image.asset('images/chaufa.png', height: 150, fit: BoxFit.fill,),
                      )
                    ],
                  ),
                ),
              )

            ]
        ),
      ),
    ),
  );
}       
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ComoLlamas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(hintText: 'Usuario'),
          )
        ],
      )
    );
  }

}

class Nombre extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container();
  }
}