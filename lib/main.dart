import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandeep/Response/login_register_response.dart';
import 'package:sandeep/routes.dart';

void main() {
  runApp(const MyApp());
}

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
      title: 'Sandeep Login Demo App',
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
    Future<void> _ArertBox(context , title) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(title),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
        _ArertBox(context,'Login Susscessfully !');
        return LoginResponseModel.fromJson(data);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print("response");
        var err = jsonDecode(response.body);
        print(err['message']);
        print("response");
        _ArertBox(context,err['message']);
        throw Exception(err['error']);
      }
    }

    Future<void> loginUser() async {
      if (emailController.text != "" && passwordController.text != "") {
        // var login2 = await login(emailController.text, passwordController.text);

        // if (login2.token != "") {
        if(emailController.text == "admin@mail.com" && passwordController.text == "password" ){
          Navigator.pushNamed(context, '/home-screen');
        }else{
          _ArertBox(context,'Email and Password combination is wrong');
        }

        // }
      } else {
        _ArertBox(context,'Email and password required');
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
                            )),
                        Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
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
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
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
                                    borderRadius: BorderRadius.circular(20.0),
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Dashboard',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 ListTile(
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 30),
//                   title: Text('Hello Sandeep!',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall
//                           ?.copyWith(color: Colors.white)),
//                   subtitle: Text('Good Morning',
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium
//                           ?.copyWith(color: Colors.white54)),
//                   trailing: const CircleAvatar(
//                     radius: 30,
//                     backgroundImage: AssetImage('assets/images/a.jpg'),
//                   ),
//                 ),
//                 const SizedBox(height: 30)
//               ],
//             ),
//           ),
//           Container(
//             color: Theme.of(context).primaryColor,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.only(topLeft: Radius.circular(200))),
//               child: GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 40,
//                 mainAxisSpacing: 30,
//                 children: [
//                   itemDashboard('Videos', CupertinoIcons.play_rectangle,
//                       Colors.deepOrange),
//                   itemDashboard(
//                       'Analytics', CupertinoIcons.graph_circle, Colors.green),
//                   itemDashboard(
//                       'Audience', CupertinoIcons.person_2, Colors.purple),
//                   itemDashboard(
//                       'Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
//                   itemDashboard('Revenue', CupertinoIcons.money_dollar_circle,
//                       Colors.indigo),
//                   itemDashboard(
//                       'Upload', CupertinoIcons.add_circled, Colors.teal),
//                   itemDashboard(
//                       'About', CupertinoIcons.question_circle, Colors.blue),
//                   itemDashboard(
//                       'Contact', CupertinoIcons.phone, Colors.pinkAccent),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20)
//         ],
//       ),
//     );
//   }
//
//   itemDashboard(String title, IconData iconData, Color background) => Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   offset: const Offset(0, 5),
//                   color: Theme.of(context).primaryColor.withOpacity(.2),
//                   spreadRadius: 2,
//                   blurRadius: 5)
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: background,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(iconData, color: Colors.white)),
//             const SizedBox(height: 8),
//             Text(title.toUpperCase(),
//                 style: Theme.of(context).textTheme.titleMedium)
//           ],
//         ),
//       );
// }
