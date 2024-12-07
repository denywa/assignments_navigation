import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String message =
        ModalRoute.of(context)!.settings.arguments as String? ??
            'Welcome to the Second Screen';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Second Screen'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/first', (route) => false,
                    arguments: 'Hello from second screen');
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
                  '/third',
                  (route) => false,
                  arguments: 'Hello from the Second Screen',
                );
              },
              child: Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/first',
                (route) => false,
                arguments: 'Hello from the Second Screen',
              );
              break;
            case 1:
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/third',
                (route) => false,
                arguments: 'Hello from the Second Screen',
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
