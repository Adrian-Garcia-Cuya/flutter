import "package:flutter/material.dart";
import 'package:nav/favorites.dart';
import 'package:nav/offers.dart';
import 'package:nav/profile_view.dart';
import 'lugares.dart';
import 'my_flights.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  String title = 'Lugares';

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
      changeTitle(index);
    });
    Navigator.pop(context);
  }

  void changeTitle(int index) {
    switch (index) {
      case 0:
        title = 'Lugares';
        break;
      case 1:
        title = 'Ofertas';
        break;
      case 2:
        title = 'Mis vuelos';
        break;
      case 3:
        title = 'Favoritos';
        break;
      case 4:
        title = 'Mi cuenta';
        break;
      default:
        title = 'error';
    }
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Lugares();
      case 1:
        return const Offers();
      case 2:
        return const MyFlights();
      case 3:
        return const Favorites();
      case 4:
        return const ProfileView();
      default:
        return const Text('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
              selected: _selectedIndex == 0,
              onTap: () {
                updateSelectedIndex(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.savings),
              title: const Text('Ofertas'),
              selected: _selectedIndex == 1,
              onTap: () {
                updateSelectedIndex(1);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.airplane_ticket),
              title: const Text('Mis vuelos'),
              selected: _selectedIndex == 2,
              onTap: () {
                updateSelectedIndex(2);
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
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Mi cuenta'),
              selected: _selectedIndex == 4,
              onTap: () {
                updateSelectedIndex(4);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedIndex),
    );
  }
}
