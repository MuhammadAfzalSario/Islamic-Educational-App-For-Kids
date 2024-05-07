import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/src/Ui/screens/dashboard/pages/other_screens/personal_data.dart';

import '../../../../../ui/widgets/setting_tile.dart';
import '../../../../../ui/widgets/user_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: UserTile(title: 'Muhammad Afzal', imageUrl: 'assets/images/logo.png'),
            ),
            const Divider(thickness: 1.5, color: Colors.grey),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SettingTile(destination: const PersonalData(), icon: Icons.person, text: 'Personal Data', iconColor: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SettingTile(destination: const PersonalData(), icon: Icons.notifications, text: 'Notifications', iconColor: Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SettingTile(destination: const PersonalData(), icon: Icons.lock, text: 'Privacy', iconColor: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SettingTile(destination: const PersonalData(), icon: Icons.payment, text: 'Payment', iconColor: Colors.green),
            ),
            SettingTile(destination: const PersonalData(), icon: Icons.help, text: 'Help & Support', iconColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
