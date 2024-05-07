import 'package:flutter/material.dart';

import '../widgets/hadees_card.dart';

class HadeesScreen extends StatelessWidget {
  const HadeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Hadees',
          style: TextStyle(
              color: Colors.green
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              HadeesCard(
                hadeesTitle: 'The best among you:',
                hadeesInArabic: 'خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَه',
                hadeesInUrdu: 'تم میں سب سے بہتر',
                hadeesTranslation: 'تم میں سب سے بہتر وہ ہے جو قرآن سیکھے اور اس کی تعلیم دے۔',
              ),
              HadeesCard(
                hadeesTitle: 'Importance of Cleanliness:',
                hadeesInArabic: 'اَلطُّهُورُ شَطْرُ الْاِيْمَانِ',
                hadeesInUrdu: 'صفائی ستھرائی کی اہمیت',
                hadeesTranslation: 'پاکیزگی ایمان کا نصف حصہ ہے۔',
              ),
              HadeesCard(
                hadeesTitle: 'Eat with right hand:',
                hadeesInArabic: 'سَمِّ اللهَ وَكُلْ بِيَمِيْنِكَِ',
                hadeesInUrdu: 'دائیں ہاتھ سے کھائیں',
                hadeesTranslation: 'اللہ کا نام لے لو اور اپنے دائیں ہاتھ سے کھاؤ۔',
              ),
              HadeesCard(
                hadeesTitle: 'Seek help from Allah:',
                hadeesInArabic: 'اِذَا سَأَلْتَ فَاسْأَلِ اللهَ',
                hadeesInUrdu: 'اللہ سے مدد مانگیںَِ',
                hadeesTranslation: 'جب بھی تم کوئی چیز مانگتے ہو تو اللہ سے مانگو۔',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
