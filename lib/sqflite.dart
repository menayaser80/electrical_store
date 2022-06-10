import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:rmsproject/archized.dart';
import 'package:rmsproject/done.dart';
import 'package:rmsproject/new.dart';
import 'package:rmsproject/reuse.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

class Offline extends StatefulWidget {
  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  int currentindex=0;
  List<Widget>screens=[
    New(),
    Done(),
    Archized(),
  ];
  List<String>title=[
    'new tasks',
    'done tasks',
    'archized tasks',
  ];
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  bool isclosed=false;
  late Database database;
  IconData fabicon=Icons.edit;
  var titlecontroller=TextEditingController();
  var subtitle=TextEditingController();
  var price=TextEditingController();
  var image=TextEditingController();
  @override
  void initState()
  {
    super.initState();
    createdatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,

      body: ConditionalBuilder(
        condition:tasks.length>0,
        builder:(context)=>screens[currentindex] ,
        fallback:(context)=>Center(child: CircularProgressIndicator()) ,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(isclosed)
        {
          if(formkey.currentState!.validate())
          {
            insertdatabase(
              image: image.text,
              title:titlecontroller.text,
             subtitle: subtitle.text,
             price: price.text,
            ).then((value){
              Navigator.pop(context);
              isclosed=false;
              setState((){
                fabicon=Icons.edit;
              });
            });

          }
        }
        else{
          scaffoldkey.currentState!.showBottomSheet((context) =>Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(20.0) ,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  defaultformfield(controller: image,
                    type: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'image must not be empty';
                      }
                      return null;
                    },
                    label: 'Task image',
                    prefix:Icons.image,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultformfield(
                    controller: titlecontroller,
                    type: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'title must not be empty';
                      }
                      return null;
                    },
                    label: 'Task title',
                    prefix:Icons.title_rounded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultformfield(
                    controller: subtitle,
                    type: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'subtitle must not be empty';
                      }
                      return null;
                    },
                    label: 'Task subtitle',
                    prefix:Icons.subtitles,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultformfield(
                    controller: price,
                    type: TextInputType.datetime,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'price must not be empty';
                      }
                      return null;
                    },
                    label: 'Task price',
                    prefix:Icons.monetization_on_outlined,
                  ),
                ],
              ),
            ),
          ) ,
          ).closed.then((value) {
            Navigator.pop(context);
            isclosed=false;
            setState((){
              fabicon=Icons.edit;
            });
          });
          isclosed=true;
          setState((){
            fabicon=Icons.add;
          });
        }
      },child: Icon(
        fabicon,
      ),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.shop_outlined,
          ),
              label: 'Shop'
          ),
          BottomNavigationBarItem(icon:IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=>Done(),
                ));
              },
          ),
              label: 'Gallery'
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.map_outlined,
          ),
              label: 'Map',
          ),
        ],
        currentIndex: currentindex,
        onTap: (index)
        {
          setState(() {
            currentindex=index;
          });        },
        selectedItemColor: Colors.red,
        backgroundColor: Colors.grey,
      ),
    );
  }
  Future<void>createdatabase()async
  {
    database=await openDatabase(
        'mena.db',
        version: 1,
        onCreate: (database,version)async
        {
          print('database created');
          await database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,image TEXT,title TEXT,subtitle TEXT,price TEXT)').then((value){
            print ('tablecreated');
          } ).catchError((error){
            print('error${error.toString()}');
          }
          );
        },
        onOpen: (database)
        {
          getdatafromdatabase(database).then((value) {
            tasks=value;

          });
          print('database opened');

        }
        );}
  Future insertdatabase(
      {
        required String image,
        required String title,
        required String subtitle,
        required String price,
      }
      ) async {
    return  await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO tasks(image,title,subtitle,price) VALUES("$image","$title","$subtitle","$price")').then((value) {
        print(' inserted successfully');
      }).catchError((error){
        print('error when inserting ${error.toString()}');
      });
      return null;
    });
  }
  Future<List<Map>> getdatafromdatabase(database)async
  {
    return await database.rawQuery('SELECT * FROM tasks');

  }
}

