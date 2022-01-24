import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:taxi/helpers/constants.dart';
import 'package:taxi/models/user_m.dart';
import 'package:taxi/services/user_s.dart';


enum Status{uninitialized, authenticated, authenticating, unauthenticated}

class UserProvider with ChangeNotifier {
  static const loggedIn = "loggedIn";
  static const id = "id";

  //FirebaseUser _user;
  Status _status = Status.uninitialized;
  final UserServices _userServices = UserServices();
  UserModel? _userModel;

//  getter
  UserModel? get userModel => _userModel;

  Status get status => _status;

  //FirebaseUser get user => _user;

  // public variables
  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();


  UserProvider.initialize(){
    //_initialize();

  }


  Future<bool> signIn() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

//    try{
    _status = Status.authenticating;
    notifyListeners();
    /*await auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((value) async {
      await prefs.setString(id, value.user.uid);
      await prefs.setBool(loggedIn, true);

      _userModel = await _userServices.getUserById(value.user.uid);
    });*/
    return true;
    //    }catch(e){
//      _status = Status.Unauthenticated;
//      notifyListeners();
//      print(e.toString());
//      return false;
//    }
  }


  Future<bool> signUp() async {
//    try{
    _status = Status.authenticating;
    notifyListeners();
    //await auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    /* await prefs.setString(id, result.user.uid);
      await prefs.setBool(loggedIn, true);
      _userServices.createUser(
        id: result.user.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        phone: phone.text.trim(),
      );
      await prefs.setString(id, result.user.uid);
      await prefs.setBool(loggedIn, true);
    });*/
    return true;
//    }catch(e){
//      _status = Status.Unauthenticated;
//      notifyListeners();
//      print(e.toString());
//      return false;
//    }
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //auth.signOut();
    _status = Status.unauthenticated;
    await prefs.setString(id, '');
    await prefs.setBool(loggedIn, false);
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
    phone.text = "";
  }

  /*Future<void> reloadUserModel()async{
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }*/

  updateUserData(Map<String, dynamic> data) async {
    _userServices.updateUserData(data);
  }

 /* saveDeviceToken() async {
    String deviceToken = await fcm.getToken();
    if (deviceToken != '') {
      _userServices.addDeviceToken(
        // userId: user.uid,
          token: deviceToken
      );
    }
  }*/


/*_initialize() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool(loggedIn) ?? false;
    if(!loggedIn){
      _status = Status.unauthenticated;
    }else{
      //await auth.currentUser().then((currentUser) async{
        //_user = currentUser;
        _status = Status.authenticated;
        _userModel = await _userServices.getUserById(currentUser.uid);
      //});
    }
    notifyListeners();
  }*/

}