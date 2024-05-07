import 'package:flutter/material.dart';
import '../../../../ui/widgets/button.dart';
import '../../../../ui/DashBoard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo Image
                    Image.asset(
                      'assets/images/logo.png', // Image path
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    // Name Text Form Field
                    // Name Text Form Field
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color(0xFF00CA80)),
                        labelText: 'Name',
                        hintText: 'Afzal',
                        hintStyle: TextStyle(color: Colors.grey), // Change this line
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                          BorderSide(color: Color(0xFF00CA80), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                          BorderSide(color: Color(0xFF00CA80), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 25.0,
                    ),

                    // Age Form Field
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color(0xFF00CA80)),
                        labelText: 'Age',
                        hintText: '3-16',
                        hintStyle: TextStyle(color: Colors.grey), // Change this line
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                          BorderSide(color: Color(0xFF00CA80), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                          BorderSide(color: Color(0xFF00CA80), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Login Button
                    CustomButton(
                      buttonText: 'Login',
                      onPressedFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()));
                        /* When the button is pressed, it navigates to the DashboardScreen.
                        The MaterialPageRoute is a modal route that replaces the entire screen with a platform-adaptive transition. */
                      },
                    ),

                    // OR Text
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),

                          // Login with Google
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            child: OutlinedButton.icon(
                              icon: Image(
                                width: MediaQuery.of(context).size.width * 0.05,
                                image: const AssetImage(
                                    'assets/images/google.png'),
                              ),
                              onPressed: () {}, // onPressed event
                              label: Text(
                                'Login with Google',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
