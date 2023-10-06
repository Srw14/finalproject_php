import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:my_app/app_config.dart';
import 'package:my_app/login/register/login.dart';
import 'package:my_app/login/register/otp.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({Key? key}) : super(key: key);

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController user_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future sign_up() async{
    try {
    String url = "http://192.168.1.43/server_project/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'first_name': first_name.text,
      'last_name': last_name.text,
      'user_name': user_name.text,
      'email': email.text,
      'password': password.text,
    });
    var data = json.decode(response.body);
    if (data == 'Error') {
      Navigator.pushNamed(context, 'home');
    } else {
      Navigator.pushNamed(context, 'register');
    }
  } catch (error) {
    print('Error: $error');
  }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create a new account',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'It is quick and easy.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Enter your first name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.perm_identity_rounded),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: first_name,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.perm_identity_rounded),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: last_name,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "UserName",
                        hintText: "Enter your username",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.perm_identity_rounded),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: user_name,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.mail_outline),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: email,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.https_outlined),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: password,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Enter your confirm password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.https_outlined),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Empty';
                        }else if(val != password.text){
                          return 'password not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD4556),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text(
                        "Create account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        bool pass = formKey.currentState!.validate();

                        if(pass){
                          sign_up();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return loginscreen();
                              }));
                            },
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                  color: Color(0xFFFD4556),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
