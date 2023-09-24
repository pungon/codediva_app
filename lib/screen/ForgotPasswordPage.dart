import 'package:flutter/material.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(    
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop(); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(languageProvider.currentLanguage['Forgot Password?']!,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(height: 15,),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Text(
                languageProvider.currentLanguage['Please enter the registered email or phone number']!,           
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
           
            const SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                hintText: languageProvider.currentLanguage['Email / Phone Number']!,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: InputBorder.none, 
                enabledBorder: InputBorder.none, 
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const ForgotSucceed()),  
                  );
                },
                child: Text(languageProvider.currentLanguage['Send']!, style:const TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ForgotSucceed extends StatelessWidget {
  const ForgotSucceed({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                const AssetImage('assets/icons8-ok-50.png'), 
                size: 150, // กำหนดขนาดของ icon
                color: Theme.of(context).colorScheme.primary, // กำหนดสีของ icon
              ),
              const SizedBox(height: 30,),
              Text(languageProvider.currentLanguage['Success']!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),
              Text(languageProvider.currentLanguage['Your password has been successfully reset']!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
              const SizedBox(height: 40,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                     Navigator.pop(context);
                  }, 
                  child: Text(languageProvider.currentLanguage['Done']!, style:const TextStyle(fontSize: 18),)
                ),
              )
          ]),
        ),
      )
    );

   
  }
}