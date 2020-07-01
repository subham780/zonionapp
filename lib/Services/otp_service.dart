class OtpService {
  String mobno;
  String otp;
  OtpService({this.mobno});

  String getOtp() {
    this.otp = '123456';
    //TODO: Use Api to fetch otp and send it to the user's device.
    return this.otp;
  }

  bool validateOtp(String givenOtp) {
    if (givenOtp == this.otp)
      return true;
    else
      return false;
  }
}
