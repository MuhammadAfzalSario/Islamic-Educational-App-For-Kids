import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.destinationScreen,
  }) : super(key: key);

  final String title;
  final String description;
  final String imagePath;
  final Widget destinationScreen;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.01),
      child: Container(
        height: screenSize.height * 0.2,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: Colors.grey,
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.01),
                  child: Container(
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Title of the story
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.02,
                        left: screenSize.height * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: screenSize.height * 0.025,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ),
                    ),
                    // Description of the story
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.002,
                        left: screenSize.height * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: 'Rubik'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * 0.04,
                        right: screenSize.height * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // Read button
                          Container(
                            height: screenSize.height * 0.05,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => destinationScreen,
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'Read',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Rubik'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
