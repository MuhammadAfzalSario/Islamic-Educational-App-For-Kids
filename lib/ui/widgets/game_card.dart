import 'package:flutter/material.dart';

const double marginSize = 11.0;
const double borderRadiusSize = 8;

class GameCard extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  const GameCard({
    Key? key,
    required this.name,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.3;
    double height = MediaQuery.of(context).size.height * 0.15;

    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 10,
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusSize),
        ),
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(marginSize),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(image),
                  height: height * 0.5,
                  width: width * 0.5,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: width * 0.11,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
