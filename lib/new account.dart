import 'package:flutter/material.dart';

class NewAccount extends StatelessWidget {
  TextEditingController n1=new TextEditingController();
  TextEditingController n2=new TextEditingController();
  TextEditingController n3=new TextEditingController();
  TextEditingController n4=new TextEditingController();
  TextEditingController n5=new TextEditingController();
  TextEditingController n6=new TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextFormField(controller: n1,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!=null &&value.isEmpty)
                            {
                              return 'required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'First name' ,border: OutlineInputBorder()
                          ),),
                      ),
                      SizedBox(width: 5.0,),
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: n2,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!=null &&value.isEmpty)
                            {
                              return 'required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Last name' ,border: OutlineInputBorder()
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: n3,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: ' user name' ,
                        border: OutlineInputBorder(),
                  ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(controller: n4,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: ' Password' ,border: OutlineInputBorder()
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(controller: n5,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'confirm Password' ,border: OutlineInputBorder()
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(controller: n6,
                    keyboardType: TextInputType.phone,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: ' phone number' ,border: OutlineInputBorder()
                    ),),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    width: 250.0,
                    color: Colors.blue,
                    child: MaterialButton(onPressed: (){
                      if(formkey.currentState!.validate())
                      {
                        print(n1.text);
                        print(n2.text);
                        print(n3.text);
                        print(n4.text);
                        print(n5.text);
                        print(n6.text);
                      }
                      },child: Text(
                      'Create'
                      ,style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 170.0,
                    color: Colors.blueGrey,
                    child: MaterialButton(onPressed: (){
                      Navigator.pop(context);
                    },child: Text(
                      'BACK',style: TextStyle(
                      fontSize: 25.0,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
