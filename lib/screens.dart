import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmsproject/sqflite.dart';
import 'package:rmsproject/widget/home%20body.dart';
import 'constants.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar:AppBar(
        elevation: 0,
        title: Text(
          'مرحبا بكم بمتجر الالكترونيات',
          style: GoogleFonts.getFont('Almarai'),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(
                builder:(context)=>Offline(),
              ));
            },
          ),
        ],
      ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: CircleAvatar(
                        backgroundImage:AssetImage('images/picture.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Mena Yaser',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('menayaser83@yahoo.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),
                title: Text('Home'),
                onTap: (){
                  print('home');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text('Setting'),
                onTap: (){
                  print('setting');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.menu,
                ),
                title: Text('menu'),
                onTap: (){
                  print('menu');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.directions_bike,
                  color: Colors.teal,
                ),

                title: Text('delivery'),
                onTap: (){
                  print('delivery');
                },

              ),
            ],
          ),
        ),
      body: HomeBody(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      leading:Drawer(
    child: ListView(
    children: [
    DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.green,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Container(
    width: 50.0,
    height: 50.0,
    child: CircleAvatar(
    backgroundImage: AssetImage('images/picture.jpg'),
    ),
    ),
    SizedBox(
    height: 10.0,
    ),
    Text('Mena Yaser',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.white,
    ),
    ),
    SizedBox(
    height: 10.0,
    ),
    Text('menayaser83@yahoo.com',
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    ),),
    ],
    ),
    ),
    ListTile(
    leading: Icon(
    Icons.home,
    color: Colors.teal,
    ),
    title: Text('Home'),
    onTap: (){
    print('home');
    },
    ),
    ListTile(
    leading: Icon(
    Icons.settings,
    ),
    title: Text('Setting'),
    onTap: (){
    print('setting');
    },
    ),
    ListTile(
    leading: Icon(
    Icons.menu,
    ),
    title: Text('menu'),
    onTap: (){
    print('menu');
    },
    ),
    ListTile(
    leading: Icon(
    Icons.directions_bike,
    color: Colors.teal,
    ),

    title: Text('delivery'),
    onTap: (){
    print('delivery');
    },

    ),
    ],
    ),
    ),
      elevation: 0,
      title: Text(
        'مرحبا بكم بمتجر الالكترونيات',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {

          },
        ),
      ],
    )
    ;
  }
}