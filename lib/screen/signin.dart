import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/screen/filmlist.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
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
            SizedBox(height: 50),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                email=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,

                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Material(
                elevation: 5,
                color:  Colors.green,

                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  onPressed:() async{

                    try{
                      final newuser= await
                      _auth.signInWithEmailAndPassword
                        (email: email,
                          password: password);
                      if (newuser!=null){
                        print('yessssssss');
                        Fluttertoast.showToast(
                          msg: 'Sucessfully sign in',
                          textColor: Colors.white,
                          backgroundColor: Colors.green,
                        );


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => filmlist(),
                          ),

                        );


                      }

                    }

                    catch(e){
                      print(e);
                      Fluttertoast.showToast(
                        msg: e.toString(),
                        textColor: Colors.white,
                        backgroundColor: Colors.red,
                      );



                    }


                  },
                  minWidth: 200,
                  height: 42,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            /* button(
              title: 'Sign in', wid: SignInScreen(),
            )*/
          ],
        ),
      ),
    );
  }
}