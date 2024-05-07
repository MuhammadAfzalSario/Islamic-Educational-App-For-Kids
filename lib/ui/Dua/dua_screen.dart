import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/widgets/dua_card.dart';
import 'package:just_audio/just_audio.dart';

class DuaScreen extends StatelessWidget {
  DuaScreen({super.key});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Duas',
          style: TextStyle(
              color: Colors.green
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'کھانے سے پہلے دعا:',
              style: TextStyle(
                fontFamily: 'Jameel-Noori',
                fontSize: width * 0.05,
              ),
            ),
            DuaCard(
                duaInArabic: 'بِسْمِ اللَّهِ وَعَلَى بَرَكَةِ اللَّهُِ',
                duaTranslation:
                    '“اللہ کے نام پر اور اللہ کے فضل و کرم سے میں کھانا شروع کرتا ہوں۔”',
                onPressed: () async {
                  await player.setAsset('assets/audio/food.opus');
                  player.play();
                }),
            Text(
              'کھانے کے بعد کے لیے دعا:',
              style: TextStyle(
                fontFamily: 'Jameel-Noori',
                fontSize: width * 0.05,
              ),
            ),
            DuaCard(
                duaInArabic:
                    'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِينَُ',
                duaTranslation:
                    '“تمام تعریفیں اللہ کے لئے ہیں جس نے ہمیں کھانا کھلایا، ہماری پیاس بجھائی اور ہمیں مسلمان بنایا۔”',
                onPressed: () async {}),
            Text(
              'سونے سے پہلے دعا کرتے ہیں:',
              style: TextStyle(
                fontFamily: 'Jameel-Noori',
                fontSize: width * 0.05,
              ),
            ),
            DuaCard(
                duaInArabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَاُ',
                duaTranslation: '''تیرے نام سے اے اللہ میں مر تا ہوں اور زندہ رہتا ہوں۔''',
                onPressed: () async {
                  await player.setAsset('assets/audio/sleep.opus');
                  player.play();
                }),
            Text(
              'جاگتے وقت دعا:',
              style: TextStyle(
                fontFamily: 'Jameel-Noori',
                fontSize: width * 0.05,
              ),
            ),
            DuaCard(
                duaInArabic:
                    'الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
                duaTranslation:
                    '''سب تعریفیں اللہ کے لیے ہیں جو ہمیں مرنے کے بعد زندہ کرتا ہے اور اسی کی طرف واپسی ہے۔''',
                onPressed: () async {}),
            Text(
              'گھر سے نکلنے سے پہلے دعا:',
              style: TextStyle(
                fontFamily: 'Jameel-Noori',
                fontSize: width * 0.05,
              ),
            ),
            DuaCard(
                duaInArabic:
                    'بِسْمِ اللهِ ، تَوَكَّلْتُ عَلَى اللهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
                duaTranslation:
                    '"میں اللہ کے نام پر توکل کرتا ہوں اور اللہ کے سوا کوئی طاقت اور طاقت نہیں ہے۔"',
                onPressed: () async {}),
          ],
        ),
      ),
    );
  }
}
