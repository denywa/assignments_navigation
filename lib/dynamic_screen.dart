import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  final int number;

  DynamicScreen({required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screens')),
      body: ListView.builder(
        itemCount: number,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Screen ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      GeneratedScreen(index: index + 1, total: number),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GeneratedScreen extends StatelessWidget {
  final int index;
  final int total;

  GeneratedScreen({required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen $index')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is screen number $index'),
            if (index < total) // Check if there is a next screen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GeneratedScreen(index: index + 1, total: total),
                    ),
                  );
                },
                child: Text('Go to Next Screen'),
              ),
            if (index == total) // If it's the last screen
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Back to First Screen'),
              ),
          ],
        ),
      ),
    );
  }
}
