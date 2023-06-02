import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileLayoutWidget extends StatelessWidget {
  const ProfileLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(143, 148, 251, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Sandeep!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/a.jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: const Color.fromRGBO(143, 148, 251, 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(context,'Videos', CupertinoIcons.play_rectangle,
                      Colors.deepOrange),
                  itemDashboard(context,
                      'Analytics', CupertinoIcons.graph_circle, Colors.green),
                  itemDashboard(context,
                      'Audience', CupertinoIcons.person_2, Colors.purple),
                  itemDashboard(context,
                      'Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                  itemDashboard(context,'Revenue', CupertinoIcons.money_dollar_circle,
                      Colors.indigo),
                  itemDashboard(context,
                      'Upload', CupertinoIcons.add_circled, Colors.teal),
                  itemDashboard(context,
                      'About', CupertinoIcons.question_circle, Colors.blue),
                  itemDashboard(context,
                      'Contact', CupertinoIcons.phone, Colors.pinkAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(context,String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5)
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white)),
        const SizedBox(height: 8),
        Text(title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium)
      ],
    ),
  );
}
