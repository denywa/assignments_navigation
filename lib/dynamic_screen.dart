import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  final int number;

  DynamicScreen({required this.number});

  @override
  Widget build(BuildContext context) {
    final String message =
        ModalRoute.of(context)!.settings.arguments as String? ??
            'Welcome to the Dynamic Screen';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Dynamic Screen'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/first', (route) => false,
                    arguments: 'Hello from Dynamic screen');
              },
              icon: Icon(Icons.arrow_back))),
      body: Column(
        children: [
          Text(message),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
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
      appBar: AppBar(
          title: Text('Screen $index'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/first', (route) => false,
                    arguments: 'Hello from screen number $index');
              },
              icon: Icon(Icons.arrow_back))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is screen number $index'),
            if (index < total)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GeneratedScreen(index: index + 1, total: total),
                    ),
                    (route) => false,
                  );
                },
                child: Text('Go to Next Screen'),
              ),
            if (index == total)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/first',
                    (route) => false,
                    arguments: 'Hello from the screen number $index',
                  );
                },
                child: Text('Go Back to First Screen'),
              ),
          ],
        ),
      ),
    );
  }
}
