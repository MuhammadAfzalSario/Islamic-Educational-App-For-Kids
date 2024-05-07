import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../controller/tasbeeh_controller.dart';
import 'package:fyp_islamic_kids/ui/Tasbeeh/alhmad_screen.dart';

class TasbeehScreen extends StatelessWidget {
  TasbeehScreen({super.key});
  final TasbeehController _tasbeehController = Get.put(TasbeehController());
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tasbeeh',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.volume_up, color: Colors.green),
                              onPressed: () async {
                                await player.setAsset('assets/audio/subhanallah.opus');
                                player.play();
                              },
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'سُبْحَانَ ٱللَّٰهِ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Al-Qalam',
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.1,
                                    locale: const Locale('ar', 'AE'),
                                  ),
                                ),
                                Text(
                                  'SubhanAllah',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: width * 0.05,
                                  ),
                                ),
                                Text(
                                  'اللہ سبحانہ و تعالیٰ کا شکر ہے',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Jameel-Noori',
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            Obx(
                  () => Text(
                '${_tasbeehController.counter}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 40.0),
              ),
            ),
            const SizedBox(height: 40),
            RawMaterialButton(
              onPressed: _tasbeehController.incrementCounter,
              fillColor: Colors.green,
              shape: const CircleBorder(),
              elevation: 10.0,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Tap",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 200.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                    elevation: 10,
                  ),
                  onPressed: () {
                    Get.off(AlhamdulilahScreen());
                  },
                  child: const SizedBox(
                    width: 50.0,
                    height: 60.0,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


