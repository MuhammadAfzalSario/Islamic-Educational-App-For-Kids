import 'package:flutter/material.dart';
import '../widgets/surah_list_tile.dart';
import 'Surahs/fatiha.dart';
import 'data_search.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Quran',
          style: TextStyle(color: Colors.green, fontSize: 20, fontFamily: 'Rubik'),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SurahListTile(
                  title: 'Al-Fatiha',
                  trailing: 'الفاتحة',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FatihaScreen()),
                    );
                  },
                ),
                SurahListTile(
                  title: 'Al-Ikhlas',
                  trailing: 'الإخلاص',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Asr',
                  trailing: 'العصر',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Kawthar',
                  trailing: 'الكوثر',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Maun',
                  trailing: 'الماعون',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Kafirun',
                  trailing: 'الكافرون',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'An-Nasr',
                  trailing: 'النصر',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Lahab',
                  trailing: 'اللهب',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Falaq',
                  trailing: 'الفلق',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'An-Nas',
                  trailing: 'الناس',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Baqarah',
                  trailing: 'البقرة',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Imran',
                  trailing: 'آل عمران',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'An-Nisa',
                  trailing: 'النساء',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Maidah',
                  trailing: 'المائدة',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Anam',
                  trailing: 'الأنعام',
                  onTap: () {},
                ),
                SurahListTile(
                  title: 'Al-Araf',
                  trailing: 'الأعراف',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}