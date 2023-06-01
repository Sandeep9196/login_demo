import 'package:flutter/material.dart';

class HomeLayoutWidget extends StatelessWidget {
  const HomeLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logoutUser() async {
      Navigator.pushNamed(context, '/auth-screen');
    }

    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 50,
            child: Text("Login Successfully !",
                style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(40)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  // elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: logoutUser,
                child: const Text("Logout",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ))
        ],
      ),
    ));
  }
}
