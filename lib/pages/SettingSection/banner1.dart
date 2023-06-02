import 'package:flutter/material.dart';
import 'package:sandeep/pages/SettingSection/paragraph1.dart';
import 'package:sandeep/pages/SettingSection/textSection1.dart';

class SettingWidgets extends StatelessWidget {
  const SettingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromRGBO(143, 148, 251, 1);

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: const Text(
          'Welcome to Setting',
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.8)),
        ),
      ),
      body: Column(children: [
        Image.asset(
          'assets/images/lake.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
      ]),
    );
  }
}
