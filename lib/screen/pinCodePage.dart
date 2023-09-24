import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:codediva_app/provider/PinProvider.dart';
import 'package:codediva_app/screen/ConfirmPinCodePage.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';


class SetPinCodePage extends StatefulWidget {
  const SetPinCodePage({super.key});
  @override
  State<SetPinCodePage> createState() => _SetPinCodePageState();
   
}

class _SetPinCodePageState extends State<SetPinCodePage> {
  String _pinCode = "";
  final int _pinLength = 4;
  
  void _addNumberToPin(String number) {
    if (_pinCode.length + number.length <= _pinLength) {
      setState(() {
        _pinCode += number;
      });
    }
    if (_pinCode.length == _pinLength){
      final pinProvider = Provider.of<PinProvider>(context, listen: false);
      pinProvider.pin = _pinCode;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const ConfirmPinCodePage()),  
      );
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
            const Flexible(
              flex: 1,
              child: SizedBox(height: 70,)
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(languageProvider.currentLanguage['Set PIN CODE']!,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  
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
                                  :Colors.white,
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
            const SizedBox(height: 10,),
            
            // Number pad
            Flexible(
              flex: 5,
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
                    return const SizedBox.shrink();  
                  } else if (index == 10) {
                    return GestureDetector(
                      onTap: () => _addNumberToPin('0'),
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
                    onTap: () => _addNumberToPin((index + 1).toString()),
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
            
          ],
        ),
      ),
    );
  }
}
