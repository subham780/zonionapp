import 'package:flutter/material.dart';
import 'package:zonionap/Screens/otp_validate_screen.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('image/zonion.jpg'),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  mobno = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    if (phoneNumberValidation(mobno: mobno)) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OtpValidateScreen(mobno: mobno);
                      }));
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Login/SignUp',
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
