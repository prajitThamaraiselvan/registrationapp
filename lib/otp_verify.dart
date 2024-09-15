import 'package:flutter/material.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 199, 21, 77),
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text("OTP Verify",
           style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 26),
          ),
        )),
      ),
    );
  }
}