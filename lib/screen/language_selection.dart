import 'package:flutter/material.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

// นำเข้าไฟล์ localization_th.dart
import 'package:codediva_app/language/localization_th.dart';

// นำเข้าไฟล์ localization_en.dart
import 'package:codediva_app/language/localization_en.dart';


import 'package:codediva_app/screen/TermsAndConditionsScreen.dart';




class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 250,),
              const Text(
                'ยินดีต้อนรับ',
                style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
              ),
              const Text(
                'กรุณาเลือกภาษา',
                style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 95, 95, 95)),
              ),
              const SizedBox(height: 100),
      
              SizedBox(
                width: MediaQuery.of(context).size.width, 
                height: 40,            
                child: ElevatedButton(
                  
                  onPressed: () {
                    languageProvider.setLanguage(localizationEn);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                    );
                  },
                  child:const Text('English'),
                ),
              ),
              const SizedBox(height: 30,),
      
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    languageProvider.setLanguage(localizationTh);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                    );
                  },
                  child:const Text('ไทย'),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}