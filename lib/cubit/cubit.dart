
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

//import 'package:geocoder/geocoder.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieapp/cubit/states.dart';
import 'package:movieapp/shared/filmdb/db.dart';
import 'package:movieapp/shared/filmdb/film%20model.dart';


class appCubit extends Cubit<appStates> {
  appCubit() : super(appInitialState());

  static appCubit get(context) => BlocProvider.of(context);
//late String sucessmess;

  int? len;


  int currentIndex = 0;
  PageController pageController=PageController(initialPage: 0);

  var picker = ImagePicker();

  ////////

  File postImg=new File('C:\Users');

  Future<void> getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    postImg = File(image!.path);
    print(postImg);
    print('immmmmmmmmmmm');
    emit(AppPostImagePickedSuccessState());
  }




  ////remove image
  void removePostImage() {
    postImg=File('');
    emit(AppRemovePostImageState());
  }


 // Uint8List? bytes;
 // String? base64Image;
  final ImagePicker pick = ImagePicker();


/*  void convertImageToBase64()
  {
    bytes=File(postImg.path).readAsBytesSync();
    base64Image=base64Encode(bytes!);
    print('iamge base 64 here');
  }*/





  List<filmModel> cartproducts = [];

  void getAllCartProducts() {
    emit(GetfilmsLoadingState());
    cartproducts.clear();
    SqlHelper.getAllfilms().then((value) {
      print("sqllllllllllllllget");
      print(value);
      for (var element in value) {
        cartproducts.add(filmModel.fromDB(element));
      }
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      print(cartproducts);
      emit(GetfilmsSuccessState());
      print("sqllllllllllllllgetemit");


      print("sqllllllllllllllgettotal");

    }).catchError((error) {
      print("sqllllllllllllllgeterror");

      print(error.toString());
      emit(GetfilmsErrorState());
    });
  }

  void addnewfilm(filmModel cartModel) {
    emit(CartAddProductLoadingState());
    SqlHelper.insertProduct(cartModel).then((value) {
      Fluttertoast.showToast(
        msg: " Film Added Successfully",
        textColor: Colors.white,
        backgroundColor: Colors.green,
      );
      getAllCartProducts();
      emit(CartAddProductSuccessState());
      print("sqllllllllllllllinsetdone");
      print(cartproducts);

    }).catchError((error) {
      print("sqllllllllllllllinseterror");

      emit(CartAddProductErrorState());
    });
  }

 /* void updateProductQuantity(int quantity, String id) {
    emit(CartUpdateProductLoadingState());
    SqlHelper.updateProductQuantity(id, quantity).then((value) {
      //   getAllCartProducts();
      emit(CartUpdateProductSuccessState());
      getTotalPrice();
    }).catchError((error) {
      emit(CartUpdateProductErrorState());
    });
  }*/

  void removeProduct(filmModel cartModel) {
    emit(CartRemoveProductLoadingState());
    SqlHelper.deleteRecorde(cartModel.id).then((value) {
      //getAllCartProducts();
      Fluttertoast.showToast(
        msg: "Removed From Cart Successfully",
        textColor: Colors.white,
        backgroundColor: Colors.green,
      );
      emit(CartRemoveProductSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CartRemoveProductErrorState());
    });
  }

  double price = 0;

}

















