import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/DashBoard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  // fetching username
  Future<String> getUserName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('userName') ?? 'UnknownUser';
    } catch (e) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, library: 'shared preferences', context: ErrorDescription('Failed to load username')));
      return 'UnknownUser';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.green,
      ),
      child: Drawer(
        child: Container(
          color: Colors.green,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    // getting username from namescreen
                    FutureBuilder<String>(
                      future: getUserName(),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return DrawerHeader(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.payment, color: Colors.white),
                        title: const Text('Support Us', style: TextStyle(color: Colors.white, fontFamily: 'Rubik')),
                        onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()))},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.help, color: Colors.white),
                        title: const Text('Help', style: TextStyle(color: Colors.white, fontFamily: 'Rubik')),
                        onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()))},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.contact_phone, color: Colors.white),
                        title: const Text('Contact Us', style: TextStyle(color: Colors.white, fontFamily: 'Rubik')),
                        onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()))},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.star_rate, color: Colors.white),
                        title: const Text('Rate', style: TextStyle(color: Colors.white, fontFamily: 'Rubik')),
                        onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()))},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
