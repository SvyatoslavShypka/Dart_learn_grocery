import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> groceries = ['Apples', 'Oranges', 'Bananas'];

  List<double> prices = [1.03, 5.08, 1.73];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Expanded(child: TextField()),
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  groceries.add('test');
                  print(groceries);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: groceries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(groceries[index]),
                // trailing: const Text('\$0'),
                trailing: Text('\$${prices[index]}'),
              ),
            );
          },
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
