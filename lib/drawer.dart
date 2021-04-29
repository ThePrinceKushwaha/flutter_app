import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     "We want The Greater Nepal",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.purple,
          //   ),
          // ),
          UserAccountsDrawerHeader(
              accountName: Text("Prince Singh"),
              accountEmail: Text("prince@merohosting.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-pHHcFePTgYU8wNYDdB06mOYHrlMDxpNGWA&usqp=CAU"),
              )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("User"),
            subtitle: Text("Prince Singh"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("prince@merohosting.com"),
            trailing: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
