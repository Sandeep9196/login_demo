import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:sandeep/Animation/FadeAnimation.dart";
import 'package:flutter/material.dart';
import 'package:sandeep/Response/login_register_response.dart';
import 'package:sandeep/routes.dart';

void main() {
  runApp(const MyApp());
}

String username = "";
String token = "";
bool isLogin = false;
bool isLoading = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce Fanda',
      color: Colors.white,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<LoginResponseModel> login(username, password) async {
      Map<String, dynamic> requestPayload = {
        "username": username,
        "password": password,
      };

      Uri url = Uri.parse('https://api.azazali.in/api/admin/auth/login');

      final response = await http.post(url,
          body: jsonEncode(requestPayload),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // SnackbarGlobal.show('Login Success', 'success');
        return LoginResponseModel.fromJson(data);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print("response");
        var err = jsonDecode(response.body);
        print(err['message']);
        print("response");
        // SnackbarGlobal.show(err['error'], 'error');
        throw Exception(err['error']);
      }
    }

    Future<void> loginUser() async {
      if (emailController.text != "" && passwordController.text != "") {
        var login2 = await login(emailController.text, passwordController.text);

        if (login2.token != "") {
          Navigator.pushNamed(context, '/home-screen');
        }
      } else {
        print('Email and password required');
      }
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/clock.png'))),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Center(
                              child: Text(
                                "Login Page",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color:
                                    Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.white))),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size.fromHeight(40)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: loginUser,
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )),
                        const SizedBox(
                          height: 70,
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
// import 'package:flutter/material.dart';
//
//
// void main() {
// 	runApp( const MyApp());
// }
// class MyApp extends StatelessWidget {
// 	const MyApp({Key? key}) : super(key: key);
//
// 	@override
//
// 	Widget build(BuildContext context) {
// 		return  MaterialApp(
// 			debugShowCheckedModeBanner: false,
// 			home: Scaffold(
// 				appBar: AppBar(
// 					title: const Text('App Title'),
// 				),
// 				body: Center(
// 					child: ElevatedButton(
// 						onPressed: (){
// 							print('print anything');
// 						},
// 						child: const Text('click'),
// 					),
// 				),
// 				bottomNavigationBar: BottomNavigationBar(
// 					items: const [
// 						BottomNavigationBarItem(
// 								label: 'Home',
//
// 								icon: Icon (Icons.home)
// 						),
// 						BottomNavigationBarItem(
// 								label: 'Settings',
// 								icon: Icon (Icons.settings)
// 						),
//
// 						BottomNavigationBarItem(
// 								label: 'Login',
// 								icon: Icon (Icons.login)
// 						),
//
// 					],
// 				),
// 			),
// 		);
// 	}
// }
//
