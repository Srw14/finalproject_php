import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/login/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/mainbody/home.dart';

class loginscreen extends StatefulWidget {
  loginscreen({Key? key}) : super(key: key);


  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController user_name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future sign_in() async{
    try {
    String url = "http://192.168.1.43/server_project/login.php";
    final response = await http.post(Uri.parse(url), body: {
      'user_name': user_name.text,
      'password': password.text,
    });
    var data = json.decode(response.body);
    if (data == 'Error') {
      Navigator.pushNamed(context, 'login');
    } else {
      Navigator.pushNamed(context, 'home');
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
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login with your user and password',
                    style: TextStyle(fontSize: 18, color: Color(0xFFA29F9F)),
                  ),
                  Text(
                    'To continue using this app.',
                    style: TextStyle(fontSize: 18, color: Color(0xFFA29F9F)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Username",
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
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      style: TextStyle(fontStyle: FontStyle.italic),
                      obscureText: true,
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
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color(0xFFA29F9F),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return forgotpasswordscreen();
                                  //   },
                                  // ));
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xFFA29F9F),
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD4556),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        bool pass = formKey.currentState!.validate();

                        if(pass){
                          sign_in();
                        }     
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return homescreen();
                        //   },
                        // ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     squaretile(imagesPath: 'assets/images/google.png'),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     squaretile(imagesPath: 'assets/images/facebook.png'),
                  //   ],
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
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
                                return Registerscreen();
                              }));
                            },
                            child: const Text(
                              'Register now',
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
