import 'package:flutter/material.dart';
import 'package:mio_1/auth/auth_service.dart';
import 'package:mio_1/pages/flash_cards.dart';
import 'package:mio_1/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
          child: Center(
            child: Image.asset(
              '/Users/akimaliev/VSProjects/mio_1/lib/images/potato.png',
              width: 150,
              height: 150,
            ),
          )
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: Text("H O M E"),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: Text("S E T T I N G S"),
            leading: Icon(Icons.settings),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: Text("F L A S H C A R D S"),
            leading: Icon(Icons.card_membership_rounded),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => FlashCardsPage(),));
            }
          ),
        ),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 25),
          child: ListTile(
            title: const Text("L O G O U T"),
            leading: const Icon(Icons.logout),
            onTap: logout,
          ),
        ),
      ],),
    );
  }
}