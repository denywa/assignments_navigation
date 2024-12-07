import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String message =
        ModalRoute.of(context)!.settings.arguments as String? ??
            'Welcome to the Third Screen';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Thrid Screen'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/first', (route) => false,
                    arguments: 'Hello from Third screen');
              },
              icon: Icon(Icons.arrow_back))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/first',
                  (route) => false,
                  arguments: 'Hello from the Third Screen',
                );
              },
              child: Text('Go Back to First Screen'),
            ),
          ],
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
                arguments: 'Hello from the Third Screen',
              );
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/second',
                (route) => false,
                arguments: 'Hello from the Third Screen',
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
