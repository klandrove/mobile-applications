import 'package:flutter/material.dart';

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}
class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Text("Dashboard"),
          Text("Calendar"),
          Text("Profile"),
          Text("Settings"),
        ][currentIndex],
        ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: <Widget>[
        NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard"),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Calendar"),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined),
            label: "Profile"),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: "Settings"),
      ])
    );
  }
}