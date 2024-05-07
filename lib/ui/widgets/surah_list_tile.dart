import 'package:flutter/material.dart';

class SurahListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final VoidCallback onTap;

  const SurahListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.green, fontSize: 20, fontFamily: 'Rubik'),
        ),
        trailing: Text(
          trailing,
          style: const TextStyle(fontSize: 20, fontFamily: 'Al-Qalam'),
        ),
        onTap: onTap,
      ),
    );
  }
}
