import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:rmsproject/archized.dart';
class Done extends StatefulWidget
{

  @override
  State<Done> createState() => _DoneState();
}
class _DoneState extends State<Done> {
  dynamic data;
  var n1=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Icon(
          Icons.camera,
        ),
        title: Text(
          'camera&Gallery',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        ),    actions: [
        IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(
              builder:(context)=>Archized(),
            ));
            Location x=new Location();
            dynamic y=await x.getLocation();
            double a=y.latitude;
            double b=y.longitude;
            print("خط الطول"+b.toString());
            print("خط العرض"+a.toString());
            },
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              (data==null)?Text('Pick Now'):Image.file(data),
              MaterialButton(onPressed: () async {
                dynamic x=ImagePicker();
                dynamic y=await x.getImage(source:ImageSource.camera);
                setState(() {
                  if(y!=null)
                  {
                    data=File(y.path);

                  }
                });
                },child: Text(
                'Camera',
                style: TextStyle(
                  fontSize: 20.0,
                  backgroundColor: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
              ),

              SizedBox(
                height: 25.0,
              ),
              MaterialButton(onPressed: () async {
                dynamic x=ImagePicker();
                dynamic y=await x.getImage(source:ImageSource.gallery);
                setState(() {
                  if(y!=null)
                  {
                    data=File(y.path);

                  }

                });
              },child: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.blue,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}