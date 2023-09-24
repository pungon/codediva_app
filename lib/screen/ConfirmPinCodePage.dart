
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:codediva_app/provider/PinProvider.dart';
import 'package:codediva_app/provider/LanguageProvider.dart';

import 'package:codediva_app/screen/TouchIDPage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class ConfirmPinCodePage extends StatefulWidget {
  final bool skipTouchID;
  const ConfirmPinCodePage({super.key ,this.skipTouchID = false});
 
  @override
  State<ConfirmPinCodePage> createState() => _ConfirmPinCodePageState();
}

class _ConfirmPinCodePageState extends State<ConfirmPinCodePage> {

  String _pinCode = "";
  final int _pinLength = 4;
  
  late final LocalAuthentication auth;
   
  @override
  void initState() {
    super.initState();

    auth = LocalAuthentication();
   
    if (widget.skipTouchID == true){
      _authenticate();
    }
    
  }

   void _checkNumberToPin(String number) {
    if (_pinCode.length + number.length <= _pinLength) {
      setState(() {
        _pinCode += number;
      });
    }
     final pinProvider = Provider.of<PinProvider>(context, listen: false);

    if (pinProvider.checkPin(_pinCode)) {
      setState(() {
        print("PIN ตรงกัน");
        
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const TouchIDPage()),  
      );
      });
    } else {
      setState(() {
        print("PIN ไม่ตรงกัน");
        
      });
    }
  }

  void _removeLastNumber() {
    if (_pinCode.isNotEmpty) {
      setState(() {
        _pinCode = _pinCode.substring(0, _pinCode.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.skipTouchID
            ?const SizedBox.shrink()
            :
            const Flexible(
              flex: 1,
              child: SizedBox(height: 70,)
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(languageProvider.currentLanguage['Confirm PIN CODE']!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(_pinLength, (index) {
                            return 
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index < _pinCode.length
                                  ?
                                    Theme.of(context).primaryColor
                                  :
                                  Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade500,  
                                      width: 2.0, 
                                    )
                              ),
                              );
                              
                          }),
                        ),
                      ),
                    ),
                  ),
              ],),
            ),
          
            // Number pad
            
            Flexible(
              flex: 4,
              child: Center(
                child: GridView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 7 / 6,
                    mainAxisSpacing: 20.0,  
                    crossAxisSpacing: 30.0,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 9) {
                    return widget.skipTouchID
                        ? GestureDetector(
                            onTap: _authenticate,
                            child:const Icon(Icons.fingerprint, size: 40),
                          )
                        : const SizedBox.shrink(); 
                    } else if (index == 10) {
                      return GestureDetector(
                        onTap: () => _checkNumberToPin('0'),
                        child: Container(
                        width: 40,  
                        height: 40,  
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade500,  
                            width: 2.0,  
                          ),
                          shape: BoxShape.circle,
                        ),
                          child:const Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    } else if (index == 11) {
                      return GestureDetector(
                        onTap: _removeLastNumber,
                        child: 
                          const Center(child: Icon(Icons.backspace, size: 35)),
                        
                      );
                    }
                        
                    return GestureDetector(
                      onTap: () => _checkNumberToPin((index + 1).toString()),
                      child: Container(
                        width: 40,  
                        height: 40,  
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade500,  
                            width: 2.0,  
                          ),
                          shape: BoxShape.circle,
                        ),
                        
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            widget.skipTouchID
            ?Flexible(
              flex: 1,
              child: TextButton(
                onPressed: (){}, 
                child: 
                  Text(languageProvider.currentLanguage['Forgot PIN?']!,style:const TextStyle(fontSize: 18),)
               
              ),
            )
            :const SizedBox.shrink()

          ],
        ),
      ),
      
    );
    
  }
  void _authenticate() async{
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    try {
    bool authenticated = await auth.authenticate(
      localizedReason: languageProvider.currentLanguage['Scan your fingerprint to verify your identity']!,
      options: const AuthenticationOptions(
      )
    );
    print('Authenticated : $authenticated');
  } on PlatformException catch (e) {
    print(e);
  }

  }
}
