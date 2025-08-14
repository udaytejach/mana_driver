import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mana_driver/services/repository.dart';
import 'package:mana_driver/viewmodels/login_viewmodel.dart';
import 'package:mana_driver/viewmodels/register_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mana_driver/Splashscreen/splashScreen.dart';
import 'package:mana_driver/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(RepositoryData()),
        ),
        ChangeNotifierProvider(create: (_) => LoginViewModel(RepositoryData())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
          dropdownMenuTheme: DropdownMenuThemeData(
            menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(4),
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
