import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:codediva_app/provider/LanguageProvider.dart';
// นำเข้าไฟล์ localization_th.dart
import 'package:codediva_app/language/localization_th.dart';


import 'package:codediva_app/screen/loginPage.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});
  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _hasAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.currentLanguage['Terms of Service']!,),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: SingleChildScrollView(
                  child: Text(
                    languageProvider.currentLanguage['Terms of Service for codediva_app']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Checkbox(
                        value: _hasAcceptedTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            _hasAcceptedTerms = value!;
                          });
                        },
                      ),
                      Text(
                        languageProvider.currentLanguage['I accept the Terms of Service']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.primary,
                            side:  BorderSide(color:  Theme.of(context).colorScheme.primary), 
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onPressed: () {
                            languageProvider.setLanguage(localizationTh);
                            Navigator.pop(context);
                          },
                          child: Text(languageProvider.currentLanguage['Reject']!, style: const TextStyle(fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                        onPressed: _hasAcceptedTerms
                            ? () {
                                
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              }
                            : null, 
                          child: Text(
                            languageProvider.currentLanguage['Accept']!,
                              style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                  
                    ],),
                  ),
                  const SizedBox(height: 10,)
                  
                ],),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}


