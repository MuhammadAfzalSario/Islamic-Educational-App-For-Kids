import 'package:flutter/material.dart';

import '../../../../../ui/widgets/constants.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kThemeColor,
          ),
        ),
      ),
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(maxHeight: 150.0),
                child: const Material(
                  color: Colors.white,
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Islam'),
                      Tab(text: 'Manners'),
                      Tab(text: 'Facts'),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(child: Text('Islam')),
                    Center(child: Text('Manners')),
                    Center(child: Text('Facts')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
