


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubit/cubit.dart';
import 'package:movieapp/cubit/states.dart';
import 'package:movieapp/screen/createnewfilm.dart';
import 'package:movieapp/screen/notfound.dart';
import 'package:movieapp/shared/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/shared/filmdb/db.dart';
import 'package:movieapp/shared/filmdb/film%20model.dart';


class filmlist extends StatelessWidget {
  const filmlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SqlHelper.initDB();
   // appCubit.get(context).getAllCartProducts();
    return BlocConsumer<appCubit, appStates>(

      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "My films",


            ),
            backgroundColor: Colors.green,
          ),
          body:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: state is GetfilmsLoadingState
                ? const CircularProgressIndicator.adaptive()
                : (appCubit.get(context).cartproducts.isEmpty)
                ? const NotFoundResultView()
                : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => CartItem(
                      cartModel:
                      appCubit.get(context).cartproducts[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 25,
                    ),
                    itemCount: appCubit.get(context).cartproducts.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
             /*   Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                  {
                    String filepath=appCubit.get(context).cartproducts[0].imageUrl.substring(6);
                    print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                  print(filepath);
                    print( appCubit.get(context).cartproducts[0].imageUrl.substring(6).replaceAll("'", ""));


                  },
            ),
 ),*/

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              navto(context, createpost());

              //  ShopLoginCubit.get(context).update();

            },
            // label: const Text('Approve'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.green,
            label: const Text('add post'),
          ),

        );
      },
    );
  }
}


class CartItem extends StatelessWidget {
  final filmModel cartModel;
  const CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
          //     File('/data/user/0/com.example.movieapp/cache/image_picker4351680322382102945.jpg'),

                 File(cartModel.imageUrl.substring(6).replaceAll("'", "")),


              //image:FileImage( '/data/user/0/com.example.movieapp/cache/image_picker4351680322382102945.jpg'),
             /*   image: NetworkImage(
               //     cartModel.imageUrl),
                   'https://img.freepik.com/free-psd/green-houseplant-mockup-psd-banner_53876-137827.jpg?w=1380&t=st=1661300452~exp=1661301052~hmac=322e9c03e18a19226627fdef7d290c7a27832075e8154e459b75b9355042e882'),*/
                fit: BoxFit.cover,
                height: 90,
                width: 130,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),

                  //   overflow: TextOverflow.ellipsis,
                  //  softWrap: true,
                ),
                Text(
                  cartModel.director,
style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.grey

),

                  textAlign: TextAlign.start,

                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                appCubit.get(context).removeProduct(cartModel);
                appCubit.get(context).getAllCartProducts();

              },
              icon: const Icon(
                Icons.delete,
                color: Colors.green,
              ),
            ),
          )

        ],
      ),
    );
  }
}

/*class filmlist extends StatelessWidget {
  const filmlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchtext=TextEditingController();
    print('11111111111111111111111111111');
    /*ShopLoginCubit.get(context).getMyPosts(TOKEN);
    print( ShopLoginCubit.get(context).myPostsModel?.data);
    ShopLoginCubit.get(context).getUserData(TOKEN);
   print( ShopLoginCubit.get(context).userModel?.data?.firstName);*/


    print('22222222222222222222222222');

    return BlocConsumer<appCubit, appStates>(


      listener: (context, state) {
//if(state is AppCreatePostSuccessState )
        //ShopLoginCubit.get(context).getMyPosts(TOKEN);
        //else

      },
      builder: (context, state) {

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title:        Text('Disscuss Form'),
              backgroundColor: Colors.green,


            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 260,
                    child: TextFormField(
                      controller: searchtext,
                      onTap:(){
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          print("test");
                        }
                      },

                      onFieldSubmitted: (value) {
                        print(value);

                        /* for(int i=0;i<ShopLoginCubit.get(context).searcheditems.length;i++) {
                                      print(ShopLoginCubit
                                          .get(context)
                                          .searcheditems[i]);
                                      print(TOKEN);
                                      print(
                                          "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkak");
                                    }*/
                        /*len = ShopLoginCubit
                                        .get(context)
                                        .len;*/
                      },
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.search,
                          color: Colors.grey,

                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        //  focusedBorder: ,
                        //  focusColor: Colors.blue,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                SizedBox(

                  width: 5,
                ),






                Container(

                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12) //
                      ),
                    ),
                    labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    isScrollable: true,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.green,
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabs: [
                      //  itemproducts(ShopLoginCubit.get(context).products),

                      Tab(
                        child: Text('all forms'),
                      ),

                      Tab(
                        child: Text('my form'),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 460,
                  child:   TabBarView(

                    children: [

                      appCubit.get(context).myPostsModel?.data!=null ?







                      SingleChildScrollView(
                        child: ListView.separated(

                          physics: NeverScrollableScrollPhysics(),

                          shrinkWrap: true,

                          reverse: true,



                          itemBuilder: (context, index) =>

                              buildpostItem( appCubit.get(context).myPostsModel?.data![index]),

                          separatorBuilder: (context, index) => SizedBox(

                            height: 10,

                          ),

                          itemCount:appCubit.get(context).myPostsModel!.data!.length.toInt() ,

                        ),
                      ):



                      Center(

                        child: CircularProgressIndicator(),

                      ),





                      Text('all')



                    ],

                  ),
                ),









              ],


            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                navto(context, createpost());

                //  ShopLoginCubit.get(context).update();

              },
              // label: const Text('Approve'),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.green,
              label: const Text('add post'),
            ),











          ),
        );
      },
    );
  }
}
Widget buildpostItem(var post)=> Container(

  child: Padding(
    padding: const EdgeInsets.all(14.0),
    child: Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          3
          ,
        ),
        color: Colors.grey[200],
      ),

      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 50.0,

                    backgroundImage: NetworkImage(
                      // 'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      // constmodel['data']['user']['imageUrl']
                        user.imageUrl


                    )
                ),

                Text(
                    user.firstName+' '+user.lastName
                  //post['title']
                  //constmodel['data']['user']['firstName']+' '+constmodel['data']['user']['lastName']
                ),
                SizedBox(
                  width: 20,
                ),
                /*Flexible(child:

  Text(DateTime.now().toString()))*/
              ],

            ),
            Text(post.title),
            Text(post.description),

            if(post.imageUrl!=null)
              Flexible(

                child: Container(


                  child: Image( image:  NetworkImage(  post.imageUrl
                  ),
                    fit: BoxFit.fill,
                    width: double.infinity,

                  ),
                ),

                /*  child: Container(


                child: Image(image:
                NetworkImage(
                    'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  //  constmodel['data']['user']['imageUrl']
                fit: BoxFit.fill,
                  width: double.infinity,

                ),
              ),*/


              ),
            Row(
              children: [
                Icon(Icons.add),
                Text('1'),
                Text('like'),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.add),
                Text('1'),
                Text('comment'),

              ],

            )


          ],
        ),
      ),
    ),
  ),
)  ;*/