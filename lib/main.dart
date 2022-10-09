import 'package:drawer_navigation/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:drawer_navigation/settingpage.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: const MaterialApp(
      title: "My app",
      home: MyDrawer(),
    ),
  ));
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final screens = const [
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Navigation"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Provider.of<NavigationProvider>(context, listen: false)
                    .changeIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Provider.of<NavigationProvider>(context, listen: false)
                    .changeIndex(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: screens[provider.currentIndex],
    );
  }
}
