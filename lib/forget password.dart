import 'package:flutter/material.dart';

class Forget_Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[100],
            ),
            Text('Search for your address',
            style: TextStyle(
              fontSize: 20.0,
            ),),
            SizedBox(
              height: 15.0,
            ),
            Text(' please enter your account                         '
                 'or phone number',
              style: TextStyle(
                fontSize: 20.0,
              ),),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email address or phone number',
                  border: OutlineInputBorder()
              ),),
           SizedBox(
             height: 25.0,
           ),
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 130.0,
                  color: Colors.blue,
                  child: MaterialButton(onPressed: (){},child: Text(
                    'Search',
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  height: 40.0,
                  width: 130.0,
                  color: Colors.blue,
                  child: MaterialButton(onPressed: (){
                    Navigator.pop(context);
                  },child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
