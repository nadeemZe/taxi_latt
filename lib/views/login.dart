import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi/helpers/screen_navigation.dart';
import 'package:taxi/helpers/style.dart';
import 'package:taxi/providers/user_p.dart';
import 'package:taxi/views/register.dart';
import 'package:taxi/widgets/custom_text.dart';
import 'package:taxi/widgets/loading.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.amberAccent,
      body: authProvider.status == Status.authenticating? const Loading() :
      SingleChildScrollView(
          child: Column(
           children: <Widget>[
            Container(
              color: white,
              height: 100,
            ),
            Container(
              color:white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/taxi.jpg", width: 230, height: 230,),
                ],
              ),
            ),
            Container(
              height: 60,
              color:white,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color:white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color:white),
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.email, color:white,)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color:white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration:const InputDecoration(
                        hintStyle: TextStyle(color:white),
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock, color:white,)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: ()async{
                  /*if(!await authProvider.signIn()){
                  //  _key.currentState.showSnackBar(
                    //    SnackBar(content: Text("Login failed!"))
                    //);
                    return;
                  }*/
                  authProvider.clearController();
                  changeScreenReplacement(context,const MyHomePage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color:black,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                       CustomText(text: "Login", color:white, size: 22,)
                      ],
                    ),),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                changeScreen(context,const RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CustomText(text: "Register here", size: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
