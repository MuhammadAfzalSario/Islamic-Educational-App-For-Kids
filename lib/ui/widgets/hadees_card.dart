import 'package:flutter/material.dart';

class HadeesCard extends StatelessWidget {
  final String hadeesTitle;
  final String hadeesInUrdu;
  final String hadeesInArabic;
  final String hadeesTranslation;

  const HadeesCard({
    super.key,
    required this.hadeesTitle,
    required this.hadeesInUrdu,
    required this.hadeesInArabic,
    required this.hadeesTranslation,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              Text(
                hadeesTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
              Text(
                hadeesInUrdu,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Jameel-Noori',
                  fontSize: 18.0,
                  locale: Locale('pk', 'UR'),
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                hadeesInArabic,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Al-Qalam',
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  locale: Locale('ar', 'AE'),
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                'ترجمہ: $hadeesTranslation',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Jameel-Noori',
                  fontSize: 18.0,
                  locale: Locale('pk', 'UR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
