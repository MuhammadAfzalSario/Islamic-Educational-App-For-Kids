import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:fyp_islamic_kids/ui/Dua/dua_screen.dart';
import 'package:fyp_islamic_kids/ui/Hadees/hadees.dart';
import 'package:fyp_islamic_kids/ui/Games/Games.dart';
import 'package:fyp_islamic_kids/ui/LearnQuran/learn_quran.dart';
import 'package:fyp_islamic_kids/ui/Quiz/quiz.dart';
import 'package:fyp_islamic_kids/ui/Quran/quran_screen.dart';
import 'package:fyp_islamic_kids/ui/Stories/stories_screen.dart';
import 'package:fyp_islamic_kids/ui/Tasbeeh/tasbeeh.dart';
import 'package:fyp_islamic_kids/ui/widgets/homepage_card.dart';

class HomePageController extends GetxController {
  var userName = 'Unknown User'.obs;

  @override
  void onInit() {
    super.onInit();
    getUserName();
  }

  void getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? 'Unknown User';
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    var hijriDate = new HijriCalendar.now();
    String formattedDate = hijriDate.toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                    () => Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assalamualaikum',
                        style: TextStyle(fontFamily: 'Rubik', fontSize: 18.0),
                      ),
                      Text(
                        '${controller.userName.value}',
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '$formattedDate',
                          style: TextStyle(fontFamily: 'Rubik', fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(const LearnQuran())),
                    image: 'assets/images/quran2.png',
                    name: "Learn Quran",
                  ),
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(const QuranScreen())),
                    image: 'assets/images/quran.png',
                    name: "Quran",
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute( DuaScreen())),
                    image: 'assets/images/dua.png',
                    name: "Dua",
                  ),
                  const SizedBox(width: 40.0),
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(const HadeesScreen())),
                    image: 'assets/images/hadees.png',
                    name: "Hadees",
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(TasbeehScreen())),
                    image: 'assets/images/tasbeeh.png',
                    name: "Tasbeeh",
                  ),
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(StoriesScreen())),
                    image: 'assets/images/stories.png',
                    name: "Stories",
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCard(
                    onTap: () =>
                        Navigator.of(context).push(createRoute(const QuizScreen())),
                    image: 'assets/images/quiz.png',
                    name: "Quiz",
                  ),
                  HomePageCard(
                    onTap: () => Navigator.of(context)
                        .push(createRoute(const GameScreen())),
                    image: 'assets/images/games.png',
                    name: "Games",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}