import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Screen'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/second',
                (route) => false,
              );
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/third',
                (route) => false,
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf890, fontFamily: 'MaterialIcons')),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf892, fontFamily: 'MaterialIcons')),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf88c, fontFamily: 'MaterialIcons')),
            label: 'Third',
          ),
        ],
      ),
    );
  }
}
