import 'package:flutter/material.dart';

import 'package:codediva_app/screen/ConfirmPinCodePage.dart';
import 'package:provider/provider.dart';
import 'package:codediva_app/provider/LanguageProvider.dart';

class TouchIDPage extends StatefulWidget {
  const TouchIDPage({super.key});
  @override
  State<TouchIDPage> createState() => _TouchIDPageState();
}

class _TouchIDPageState extends State<TouchIDPage> {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(languageProvider.currentLanguage['Touch ID']!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(languageProvider.currentLanguage['Set up fingerprint login for faster access']!,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                )
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100,bottom: 120),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60), 
                        ),
                        child: Icon(
                          Icons.fingerprint,
                          size: 120,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text(languageProvider.currentLanguage['Set up Touch ID fingerprint']!),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfirmPinCodePage(skipTouchID: true),
                          ),
                        );
                      },
                      child: Text(languageProvider.currentLanguage['Skip']!),
                    ),
                ]),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
