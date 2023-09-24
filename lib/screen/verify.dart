import 'package:flutter/material.dart';
import 'dart:async'; 

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

import 'package:codediva_app/screen/pinCodePage.dart';

class VerifyByNumberPage extends StatefulWidget {
  const VerifyByNumberPage({super.key});
  @override
  State<VerifyByNumberPage> createState() => _VerifyByNumberPageState();
}

class _VerifyByNumberPageState extends State<VerifyByNumberPage> {
   final TextEditingController _controller = TextEditingController();
   int countdown = 60;
   bool showResendButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    startTimer();
  }

  _onTextChanged() {
    if (_controller.text.length == 6 && int.tryParse(_controller.text) != null) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const SetPinCodePage()),  // แทนที่ YourNextPage ด้วยหน้าต่อไปของคุณ
      );
    }
  }
  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        setState(() {
          showResendButton = true;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(languageProvider.currentLanguage['Verify Identity']!,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text(languageProvider.currentLanguage['Please enter the verification code we sent you']!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.shade700),),
              const SizedBox(height: 10,),
              Text('082-XXX-8998',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.shade700),),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                autofocus: true,
                showCursor: false,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: const TextStyle(letterSpacing: 35.0,fontSize: 20),
                textAlign: TextAlign.center,
                decoration:const InputDecoration(  
                  counterText: '',
                  
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                ),
              
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 60,bottom: 20),
                      child: Text(languageProvider.currentLanguage["Didn't receive the code?"]!,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
                    ),
                    
                    
                    showResendButton
                    ? ElevatedButton(
                        onPressed: () {
                          // โค้ดสำหรับการส่งรหัสผ่าน
                        },
                        child: Text(languageProvider.currentLanguage["Resend Code"]!),
                      )
                    : Text(
                        '${languageProvider.currentLanguage["Resend Code"]!} $countdown',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                
                ],),
              )
              
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
