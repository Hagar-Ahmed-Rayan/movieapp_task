import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movieapp/screen/signin.dart';
import 'package:movieapp/screen/signup.dart';
import 'package:movieapp/shared/components.dart';

class welcomscreen extends StatefulWidget {
  const welcomscreen({Key? key}) : super(key: key);

  @override
  _welcomscreenState createState() => _welcomscreenState();
}

class _welcomscreenState extends State<welcomscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,

                ),
                Text(
                  'Films',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            button(
              color: Colors.green,
              title: 'Sign in',
              wid:SignInScreen(),


            ),
            button(
              color: Colors.green,
              title: 'register',
              wid:RegistrationScreen(),


            )
          ],
        ),
      ),
    );
  }
}