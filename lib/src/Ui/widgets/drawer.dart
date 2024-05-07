import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Theme to change the color of the entire drawer
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black,  // Set the color of the drawer to black
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            // Use Expanded to make the ListView take up all available space
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // Define the DrawerHeader
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ), child: null,
                  ),
                  const Divider(color: Colors.white),  // Add a divider after the header
                  // Define the Home ListTile
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text('Home', style: TextStyle(color: Colors.white)),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  // Define the Contact Us ListTile
                  ListTile(
                    leading: const Icon(Icons.perm_contact_cal_rounded, color: Colors.white),
                    title: const Text('Contact Us', style: TextStyle(color: Colors.white)),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  // Define the Support Us ListTile
                  ListTile(
                    leading: const Icon(Icons.monetization_on, color: Colors.white),
                    title: const Text('Support Us', style: TextStyle(color: Colors.white)),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  // Define the Settings ListTile
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text('Settings', style: TextStyle(color: Colors.white)),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                ],
              ),
            ),
            // Define the Logout option at the bottom of the drawer
            Container(
              color: Colors.black,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle logout here
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
