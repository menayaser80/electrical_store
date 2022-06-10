import 'package:flutter/material.dart';

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

    keyboardType:type,
    onChanged:onchange

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