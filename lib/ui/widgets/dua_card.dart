import 'package:flutter/material.dart';

class DuaCard extends StatelessWidget {
  final String duaInArabic;
  final String duaTranslation;
  final VoidCallback onPressed;

  DuaCard({
    required this.duaInArabic,
    required this.duaTranslation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(16.0 * width / 412),
      child: Padding(
        padding: EdgeInsets.all(8.0 * width / 412),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(5.0 * width / 412),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.volume_up, color: Colors.green),
                      onPressed: onPressed,
                    ),
                    Expanded( // Add this
                      child: Column(
                        children: <Widget>[
                          Text(
                            duaInArabic,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Al-Qalam',
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05,
                              locale: const Locale('ar', 'AE'),
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Text(
                            'ترجمہ: $duaTranslation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Jameel-Noori',
                              fontSize: width * 0.045,
                              locale: const Locale('pk', 'UR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}