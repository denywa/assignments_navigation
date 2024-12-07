import 'package:assignments_navigation/dynamic_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String message =
        ModalRoute.of(context)!.settings.arguments as String? ??
            'Welcome to the First Screen';

    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number (1-100)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? number = int.tryParse(_controller.text);
                if (number != null && number > 0 && number <= 100) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DynamicScreen(number: number),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Please enter a valid number between 1 and 100')),
                  );
                }
              },
              child: Text('Generate Screens'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: 'Hello from the First Screen',
                );
              },
              child: Text('Go to Second Screen'),
            ),
          ],
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
                arguments: 'Hello from the First Screen',
              );
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/third',
                (route) => false,
                arguments: 'Hello from the First Screen',
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
