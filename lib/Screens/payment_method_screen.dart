import 'package:flutter/material.dart';
import 'package:zonionap/Screens/order_place_screen.dart';
import 'package:zonionap/Services/payment.dart';
import 'package:zonionap/Utilities/reusable_card.dart';
import 'package:zonionap/Utilities/round_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int payment = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Summary',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: Colors.white,
                cardChild: Center(child: Text('Order Summary')),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Cash'),
                      leading: Radio(
                        value: 1,
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Others'),
                      leading: Radio(
                        value: 2,
                        groupValue: payment,
                        onChanged: (value) {
                          setState(() {
                            payment = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RoundButton(
              onTap: () {
                if (payment == 2) {
                  Payment paymentObj = Payment();
                  paymentObj.openCheckout(
                    amount: 1,
                    description: 'Nothing',
                  );
                  print(paymentObj.result);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPlaceScreen()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
