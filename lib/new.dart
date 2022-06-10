import 'package:flutter/material.dart';

import 'package:rmsproject/constants.dart';
import 'package:rmsproject/reusable.dart';
class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder:(context,index)=>builditem(
        tasks[index]
    ), separatorBuilder: (context,index)=>Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    ), itemCount: tasks.length);
  }
}
