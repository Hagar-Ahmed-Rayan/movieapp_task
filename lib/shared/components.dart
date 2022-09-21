import 'dart:math';

import 'package:flutter/material.dart';

void navto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  double width =300,

  // Function onChange,
  //Function onTap,
  bool isPassword = false,
  required  validate,
  required dynamic label,
}) =>
    SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        keyboardType: type,

        style: TextStyle(

          color: Colors.black,),

        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,


        ),
      ),
    );
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));




















class button extends StatelessWidget {


  const button({required this.color,required this.title, required this.wid});
  final Color color;
  final String title;
  final Widget wid;



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed:() async{

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => wid
              ),

            );

          },
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
