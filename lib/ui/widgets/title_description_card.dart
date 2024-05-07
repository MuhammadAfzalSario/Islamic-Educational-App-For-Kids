import 'package:flutter/material.dart';

class TitleDescriptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String verses;

  TitleDescriptionCard(
      {super.key, required this.title, required this.description, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Al-Qalam',
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'AlQalam',
                        ),
                      ),
                        Text(
                          verses,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Al-Qalam',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
