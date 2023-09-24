import 'package:flutter/material.dart';
import 'package:codediva_app/screen/verify.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class PreVerifyByNumberPage extends StatelessWidget {
  const PreVerifyByNumberPage({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageIcon(
                AssetImage('assets/icons8-otp-64.png'), 
                size: 100.0, 
              ),
              const SizedBox(height: 10,),
              Text(languageProvider.currentLanguage['OTP will be sent to your phone number']!,
                style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('082-XXX-8998',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
      
              const SizedBox(height: 40),
              
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerifyByNumberPage(),
                        ),
                      );
                  },
                  child: Text(languageProvider.currentLanguage['Request OTP code']!,style:const TextStyle(fontSize: 16),),
                ),
              ),
              const SizedBox(height: 20,),
              Text(languageProvider.currentLanguage['In case of an incorrect phone number, please contact 02-xxx-xxxx.']!,style: TextStyle(fontSize: 12,color: Colors.grey.shade700)),
            ]
          ),
        ),
      ),
    );
  }
}
