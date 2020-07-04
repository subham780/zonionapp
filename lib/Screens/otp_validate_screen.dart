import 'package:flutter/material.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Services/otp_service.dart';

class OtpValidateScreen extends StatefulWidget {
  final String mobno;
  OtpValidateScreen({@required this.mobno});
  @override
  _OtpValidateScreenState createState() => _OtpValidateScreenState();
}

class _OtpValidateScreenState extends State<OtpValidateScreen> {
  String mobnos;
  String enteredOtp;
  String requestedOtp;
  Color borderColor = Colors.green;
  @override
  void initState() {
    super.initState();
    mobnos = widget.mobno;
    getOtp();
  }

  void getOtp() {
    OtpService otpObj = OtpService(mobno: mobnos);
    requestedOtp = otpObj.getOtp();
  }

  void otpValidate() {
    if (requestedOtp == enteredOtp) {
      Navigator.pushNamed(context, HomeScreen.id);
    } else {
      setState(() {
        borderColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 65.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Expanded(
                  child: Text(
                    'OTP SENT',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    enteredOtp = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'OTP',
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      otpValidate();
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Validate',
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => getOtp(),
                child: Text('Resend OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
