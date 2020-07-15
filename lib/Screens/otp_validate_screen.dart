import 'package:flutter/material.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Services/otp_service.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/round_button.dart';

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
    return SafeArea(
      child: Scaffold(
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
                  decoration: kCircularTextField.copyWith(
                    hintText: 'OTP HERE',
                  ),
                ),
                RoundButton(
                  text: 'Validate',
                  onTap: () => otpValidate(),
                ),
                FlatButton(
                  onPressed: () => getOtp(),
                  child: Text('Resend OTP'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
