import 'package:flutter/material.dart';
import 'package:rmsproject/product.dart';

Widget defaultbutton(
    {
      double width=double.infinity,
      Color background=Colors.blue,
      required VoidCallback function,
      bool isuppercase=true,
      required String text,
      double radius=0.0,
    })=>Container(
  width: width,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(onPressed:function,
    child: Text(
      isuppercase? text.toUpperCase():text,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  required String? Function(String?val)?validator,
  required String label,
  required IconData prefix,
  VoidCallback? ontap,
  bool isclickable=true,
})=> TextFormField(
  controller: controller,
  decoration: InputDecoration(
    prefixIcon: Icon(
      prefix,
    ),
    labelText: label,
    border: OutlineInputBorder(),
  ),
  validator: validator,
  onTap: ontap,
  keyboardType:type,
  onChanged:onchange,
  enabled: isclickable,

);
Widget defaultpassword({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  required String? Function(String?val)?validator,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool ispassword=false,
  VoidCallback? suffixpressed,
})=>TextFormField(
  controller: controller,
  decoration: InputDecoration(
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix!=null?IconButton(
      onPressed:suffixpressed,
      icon:   Icon(
        suffix,
      ),
    ):null,
    labelText: label,
    border: OutlineInputBorder(),
  ),
  validator: validator,
  keyboardType:type,
  obscureText: ispassword,
  onChanged: onchange,
);
Widget builditem(
    Map model
    )=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 50.0,
       backgroundImage: AssetImage('images/${model['image']}'),
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${model['title']}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),),
          Text('${model['subtitle']}',
            style: TextStyle(
              color: Colors.grey,
            ),),
          SizedBox(
            height: 20.0,
          ),
          Text('${model['price']}',
            style: TextStyle(
              color: Colors.grey,
            ),),

        ],
      ),
    ],
  ),
);