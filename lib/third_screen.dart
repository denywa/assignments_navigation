import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/first',
              (route) => false, // Remove all previous routes
            );
          },
          child: Text('Go Back to First Screen'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/first',
                (route) => false,
              );
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/second',
                (route) => false,
              );
              break;
            case 2:
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
