import 'package:flutter/material.dart';
import 'package:taxi/providers/app_state.dart';
import 'package:taxi/providers/user_p.dart';
import 'package:taxi/views/login.dart';
//import 'package:txapita/screens/splash.dart';
//import 'locators/service_locator.dart';
//import 'screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //setupLocator();
  return runApp(
      MultiProvider(
       providers: [
        ChangeNotifierProvider<AppStateProvider>.value(
         value: AppStateProvider(),
      ),
        ChangeNotifierProvider<UserProvider>.value(
         value: UserProvider.initialize(),
      ),
      ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TaxiLatt',
        theme: ThemeData(
        primarySwatch: Colors.amber,
        ),
        home: const MyApp(),
    ),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 /*   UserProvider auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
       return MyHomePage();
      default:
       */ return const LoginScreen();
    }
  }
//}
