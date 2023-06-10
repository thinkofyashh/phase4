import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey=GlobalKey<FormState>();
  final email= TextEditingController();
  final password=TextEditingController();

  Future loginDetail({required String email,required String password}) async {
    var map = {};
    map['username'] = email;
    map['password'] = password;
    var response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'), body: map);
    if (response.statusCode == 200) {
      print("ass ${jsonDecode(response.body)}");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height:30,
            ),
            TextFormField(
              controller: email,
              validator: (value){
                if(value!.isEmpty){
                  return "please enter your email";
                }
              }
            ),
            TextFormField(
                controller: password,
                validator: (value){
                  if(value!.isEmpty){
                    return "please enter your email";
                  }
                }
            ),

            ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
    print("yes");
    loginDetail(email: email.text, password: password.text);
    }
              else{
                print("fail");
              }
            }, child: Text("login")),
          ],

        ),
      ),
    );
  }
}
