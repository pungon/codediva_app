import 'package:flutter/material.dart';
import 'package:codediva_app/screen/Splash Screen.dart';
import 'package:provider/provider.dart';
import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:codediva_app/provider/PinProvider.dart';


void main() {
  runApp(  
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PinProvider(),
        ),
        // เพิ่ม Provider อื่น ๆ ได้ตรงนี้
      ],
      child:const MyApp(),
  ),);
}


var KColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 96, 149));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: KColorScheme,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:   KColorScheme.primary,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade500, width: 1.0), 
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)), 
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: OutlinedButton.styleFrom(
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)), 
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0
          ),
        ),
        iconTheme: IconThemeData(
          color: KColorScheme.primary,
        )
      ),    
      
      home: SplashScreen(),
    );
  }
}

  

