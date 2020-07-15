import 'package:flutter/material.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Screens/otp_validate_screen.dart';
import 'package:zonionap/Utilities/bottom_button.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/round_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mobno;
  Color borderColor = Colors.green;

  bool phoneNumberValidation({String mobno}) {
    //TODO: ADD more validations in future here
    if (mobno != null && mobno.length == 10) {
      borderColor = Colors.green;
      return true;
    } else {
      setState(() {
        borderColor = Colors.red;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            ListTile(
              trailing: BottomButton(
                text: 'Skip',
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 130.0,
                    child: Image.asset('image/zonion.jpg'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        mobno = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: kCircularTextField.copyWith(
                      hintText: 'Mobile Number',
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundButton(
                    text: 'Login/Sign Up',
                    onTap: () {
                      if (phoneNumberValidation(mobno: mobno)) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OtpValidateScreen(mobno: mobno);
                        }));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
