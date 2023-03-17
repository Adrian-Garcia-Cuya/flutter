import "package:flutter/material.dart";
import 'lugares.dart';
import 'usuarios.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Usuarios();
      case 1:
        return const Lugares();
      default:
        return const Text('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset('images/logo.jpeg', fit: BoxFit.fill),
            ),
            ListTile(
              leading: const Icon(Icons.airplanemode_active),
              title: const Text('Lugares'),
              selected: _selectedIndex == 1,
              onTap: () {
                updateSelectedIndex(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.savings),
              title: const Text('Ofertas'),
              selected: _selectedIndex == 0,
              onTap: () {
                updateSelectedIndex(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.corporate_fare),
              title: const Text('Hoteles'),
              selected: _selectedIndex == 2,
              onTap: () {
                updateSelectedIndex(2);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.airplane_ticket),
              title: const Text('Mis vuelos'),
              selected: _selectedIndex == 3,
              onTap: () {
                updateSelectedIndex(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              selected: _selectedIndex == 3,
              onTap: () {
                updateSelectedIndex(3);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedIndex),
    );
  }
}
