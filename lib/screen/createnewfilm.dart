


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubit/cubit.dart';
import 'package:movieapp/cubit/states.dart';
import 'package:movieapp/screen/filmlist.dart';
import 'package:movieapp/shared/components.dart';
import 'package:movieapp/shared/filmdb/film%20model.dart';


class createpost extends StatelessWidget {
  const createpost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var titleController = TextEditingController();
    var disController = TextEditingController();

    return BlocConsumer<appCubit, appStates>(

      listener: (context, state) {
        if (state is AppPostImagePickedSuccessState) {
    //      appCubit.get(context).convertImageToBase64();
          print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
        }

      },
      builder: (context, state) {

        return Scaffold(
            appBar: null,
            body:SafeArea(
              child: Center(
                child: Column(
                  children: [

                    MaterialButton(
                      onPressed: (){
                        print(('###########'));
                        //   ShopLoginCubit.get(context).getPostImage();

                        appCubit.get(context).getImage();


                      },
                      child: Text(
                        'upload img',
                        style: TextStyle(
                          //   color: Colors.white,
                        ),
                      ),
                    ),
                    defaultFormField(
                      controller: titleController,
                      type: TextInputType.text,
                      label: 'name',
                      validate: (dynamic? value) {
                        if (value!.isEmpty)
                          return 'name can not be null';

                      },
                    ),
                    defaultFormField(
                      controller: disController,
                      type: TextInputType.text,
                      label: 'director',
                      validate: (dynamic? value) {
                        if (value!.isEmpty)
                          return 'write director name';

                      },
                    ),
                    MaterialButton(
                      onPressed: (){

                        appCubit.get(context).addnewfilm(
                          filmModel(
                            id: getRandomString(15),
                            name: titleController.text,

                            imageUrl:appCubit.get(context).postImg.toString(),
                            director: disController.text,


                            // "https://lavie.orangedigitalcenteregypt.com${item['imageUrl']}",
                          ),
                        );


print('hiiiiiiiiiiiiiiiiii');

                        navto(context, filmlist());
                      },
                      // function,
                      child: Text(
                        'post',
                        style: TextStyle(
                          // color: Colors.white,
                        ),
                      ),
                    ),

                    if(appCubit.get(context).postImg != null)
                      Flexible(
                        child: Stack(


                          children: [
                            Container(
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0,),
                                image: DecorationImage(
                                  image: FileImage(appCubit.get(context).postImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                           /* Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {
                                    appCubit.get(context).removePostImage();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                ),
                              ),
                            ),*/

                          ],
                        ),
                      ),





                  ],

                ),
              ),
            )

        );
      },
    );
  }
}
