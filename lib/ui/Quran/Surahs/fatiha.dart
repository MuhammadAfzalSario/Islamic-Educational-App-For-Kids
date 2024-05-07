import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/title_description_card.dart';

class FatihaScreen extends StatefulWidget {
  const FatihaScreen({super.key});

  @override
  _FatihaScreenState createState() => _FatihaScreenState();
}

class _FatihaScreenState extends State<FatihaScreen> {
  late Future<Map<String, dynamic>> surah;

  Future<Map<String, dynamic>> fetchSurah() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.alquran.cloud/v1/surah/01/ar.Fatihah'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load Surah');
      }
    } catch (e) {
      throw Exception('No Internet Connection');
    }
  }

  @override
  void initState() {
    super.initState();
    surah = fetchSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Al-Fatiha',
          style: TextStyle(
              color: Colors.green
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitleDescriptionCard(
            title: 'الفاتحة',
            description: 'مكي',
            verses: '7 آيات',
          ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: surah,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!['data']['ayahs'].length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                              child: Text(
                                  '${snapshot.data!['data']['ayahs'][index]['text']} -',
                                  style: const TextStyle(
                                      fontFamily: 'Al-Qalam',
                                      color: Colors.black,
                                      fontSize: 20),
                                  textAlign: TextAlign.center)),
                        ),
                        onTap: () {},
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                      "Error occurred while fetching data. Please check your internet connection and try again.",
                      style: TextStyle(color: Colors.red, fontSize: 20));
                }

                return Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.blue,
                    size: 100,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
