import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'About Info',
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(height: 20),
             const Center(child: Text('About', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Name', style: TextStyle(fontSize: 22)),
                const Text('Afzal', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 const Text('Age', style: TextStyle(fontSize: 22)),
                const Text('21', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Email', style: TextStyle(fontSize: 22)),
                const Text('xyz', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child:ElevatedButton(
                onPressed: () {},
                style:ElevatedButton.styleFrom(backgroundColor:
                Colors.green),
                child:
                const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal:
                    20, vertical:
                    20),
                    child:
                    Text('Logout',
                        style:
                        TextStyle(fontSize:
                        20)
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
