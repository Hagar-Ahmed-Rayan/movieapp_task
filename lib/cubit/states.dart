
abstract class appStates {}

class appInitialState extends appStates {}
class AppChangeBottomNavState extends appStates {}
class readjsonLoding extends appStates {}
class readjsonSuccessful extends appStates {}


class readjesonErrorState extends appStates
{
  final dynamic error;

  readjesonErrorState(this.error);
}
class AppRemovePostImageState extends appStates {}

class AppPostImagePickedSuccessState extends appStates {}
////////////////database
class GetfilmsLoadingState extends appStates {}
class GetfilmsSuccessState extends appStates {}
class GetfilmsErrorState extends appStates {}


 class CartAddProductLoadingState extends appStates {}

class CartAddProductSuccessState extends appStates {}


 class CartAddProductErrorState extends appStates {}
///

    class CartRemoveProductLoadingState extends appStates {}

   class   CartRemoveProductSuccessState extends appStates {}
  class  CartRemoveProductErrorState extends appStates {}
