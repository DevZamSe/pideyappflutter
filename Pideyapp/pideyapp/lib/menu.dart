import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  Home _home = Home();
  final Listado _funcionarios = Listado();
  final Mapa _mapa = Mapa();
  final Ventana _ventana = Ventana();  
  final Usuario _usuario = Usuario();

  Widget _showPage = new Home();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
      return _home;
      break;
      case 1:
      return _funcionarios;
      break;
      case 2:
      return _mapa;
      break;
      case 3:
      return _ventana;
      break;
      case 4:
      return _usuario;
      break;
      default:
      return new Container(
        child: new Center(
          child: new Text('no presionaste ninguna pagina')
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.view_stream, size: 30),
            Icon(Icons.payment, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.orange,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.orange,
          child: Center(
                child: _showPage,
          ),
        ));
    }
  }

class Home extends StatelessWidget implements State <CarouselSlider> {
  
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
          padding: EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              CarouselSlider(
                height: 320.0,
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
                padding: EdgeInsets.only(top: 25.0, left: 25.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[  
                        Text('Bienvenidos a PideYapp', 
                          style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Quicksand'),
                          textAlign: TextAlign.left,),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 14.0, left: 25.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Unos antojitos ..', 
                          style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: 'Quicksand'),
                          textAlign: TextAlign.left,),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 130.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 30.0, left: 25.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Platos a la carta', 
                          style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: 'Quicksand'),
                          textAlign: TextAlign.left,),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 130.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(image: 'images/chaufa.png'),
                          makeItem(image: 'images/consome.jpg'),
                          makeItem(image: 'images/ensaladita.jpg'),
                          makeItem(image: 'images/estofado.jpg'),
                          makeItem(image: 'images/menestron.jpg')
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 30.0, left: 25.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Sopas', 
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                          textAlign: TextAlign.left,),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 130.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(image: 'images/chaufa.png'),
                          makeItem(image: 'images/consome.jpg'),
                          makeItem(image: 'images/ensaladita.jpg'),
                          makeItem(image: 'images/estofado.jpg'),
                          makeItem(image: 'images/menestron.jpg')
                        ],
                      ),
                    )
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
 
class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Text('No has realizado ningun pedido aun', style: TextStyle(color: Colors.white),)
      );
  }
}

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        
    );
  }

  
}
 
class Ventana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: "https://www.miraflores.gob.pe/",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
 
class Usuario extends StatelessWidget {

  var listview = ListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child: Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            ListTitle(
                          title: Text("Ingresar mis puntos"),
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> Holitas())
                            );
                          },
                        ),
                        
                        ListTitle(
                          title: Text("Notificaciones"),
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> Holitas())
                            );
                          },
                        ),
            
                        ListTitle(
                          title: Text("Cerrar Sesión"),
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> Holitas())
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            
              ListTitle({Text title, Null Function() onTap}) {}
}

class Holitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: "https://www.miraflores.gob.pe/",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}