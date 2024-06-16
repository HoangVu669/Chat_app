import 'package:chat_app/services/auth/auth_services.dart';
import 'package:chat_app/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final _auth = AuthService();
    _auth.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                size: 40,
              ),
            ),
          ),

          //home list tile
          Padding(padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title:  Text("HOME"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          //setting list tile
          Padding(padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              title:  Text("SETTINGS"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SettingsPage(),)
                );
              },
            ),
          ),

          //logout list tile
          Padding(padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title:  Text("LOGOUT"),
              leading: Icon(Icons.logout),
              onTap: logout
            ),
          )
        ],
      ),
    );
  }
}
