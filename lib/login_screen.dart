import 'package:flutter/material.dart';
import 'package:rmsproject/animation.dart';
import 'package:rmsproject/forget%20password.dart';
import 'package:rmsproject/new%20account.dart';
import 'package:rmsproject/reuse.dart';
import 'package:share/share.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var n1 =TextEditingController();
  var formkey=GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Share.share(" Rms Project");
            String x=n1.text.toString();
            Share.share(x);
          }, icon: Icon(
            Icons.share,
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formkey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LoGin',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: emailcontroller,
                      validator: (value)
                      {
                        if(value!.isEmpty&&value!=null)
                        {
                          return 'email address must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                            Icons.email
                        ),
                        labelText: 'email address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value)
                      {
                        print(value);
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultpassword(
                    controller: passwordcontroller,
                    type: TextInputType.visiblePassword,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'password is too short';
                      }
                      return null;
                    },
                    label: 'password',
                    prefix: Icons.lock,
                    suffix: ispassword?Icons.remove_red_eye:Icons.visibility_off,
                    ispassword: ispassword,
                    suffixpressed: (){
                      setState(() {
                        ispassword=!ispassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(onPressed: (){
                      if(formkey.currentState!.validate())
                        {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        }

                      },child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      color: Colors.blue,
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>animation(),
                        ));
                        },
                        child: Text(
                        'GO',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder:(context)=>NewAccount(),
                          ));
                        },child: Text(
                          'Create Account'
                          ,style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder:(context)=>Forget_Password(),
                          ));
                        },child: Text(
                          'Forget password?'
                          ,style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        ),
                        ),
                      ],
                    ),
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
