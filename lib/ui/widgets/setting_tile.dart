import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingTileController extends GetxController {
  var isSwitched = false.obs;
}

class SettingTile extends StatelessWidget {
  final Widget destination;
  final IconData icon;
  final String text;
  final Color iconColor;
  final SettingTileController controller = Get.put(SettingTileController());

  SettingTile({
    Key? key,
    required this.destination,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).size.width * 0.05; // 5% of screen width
    double iconSize = MediaQuery.of(context).size.width * 0.08; // 8% of screen width

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Add a dim color to the background
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Add some padding to keep the content away from the edges
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0), // Padding for the grey stroke
              decoration: BoxDecoration(
                color: Colors.white, // Change the color to white
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1.0), // Add a grey stroke
              ),
              child: Icon(icon, color: iconColor, size: iconSize),
            ),
            const SizedBox(width: 15,),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize)),
            const Spacer(),
            if (text == 'Notifications')
              Obx(() => Switch(
                value: controller.isSwitched.value,
                onChanged: (value) {
                  controller.isSwitched.value = value;
                  if (text != 'Notifications') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => destination),
                    );
                  }
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ))
            else
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
