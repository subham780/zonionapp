import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

const String razorpayApiKey = 'rzp_test_pgzDlXS2XSd5cd';

class Payment {
  String result;
  static const platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorpay;
  void dispose() {
    _razorpay.clear();
  }

  Payment() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(
      {@required double amount, @required String description}) async {
    var options = {
      'key': razorpayApiKey,
      'amount': amount * 100,
      'name': 'Zonion',
      'description': description,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Payment.openCheckout -> $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    result = "SUCCESS: " + response.paymentId;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    result = "ERROR: " + response.message;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    result = "EXTERNAL_WALLET: " + response.walletName;
  }
}
