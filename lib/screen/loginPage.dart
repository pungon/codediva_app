import 'package:flutter/material.dart';

import 'package:codediva_app/screen/preverify.dart';
import 'package:codediva_app/screen/ForgotPasswordPage.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
var loginStatus = '';



class _LoginPageState extends State<LoginPage> {
  bool checkStatus = false;
  
  @override
  Widget build(BuildContext context) {

  var languageProvider = Provider.of<LanguageProvider>(context);

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return GestureDetector(
        onTap: () {
      
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Flexible(
                    flex: 2,
                    child: SizedBox(height: 100,)
                  ),
                  Flexible(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: languageProvider.currentLanguage['username']!,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: languageProvider.currentLanguage['password']!,
                            
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(loginStatus,style: const TextStyle(color: Colors.red),),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: checkStatus,
                                  fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return null; 
                                    }
                                    return Colors.transparent; 
                                  }),
                                  shape: RoundedRectangleBorder(
                                    
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                            
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkStatus = value!;
                                    });
                                   
                                  },
                                ),
                                Text(languageProvider.currentLanguage['Remember sign-in']!,style: TextStyle(color: Colors.grey.shade700)),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                              ).then((value) => FocusScope.of(context).unfocus());
                              },
                              child: Text(languageProvider.currentLanguage['Forgot Password?']!,style: TextStyle(color: Colors.grey.shade700),),
                            ),
                            
                          ],
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            
                            //String username = usernameController.text; 
                            //String password = passwordController.text; 
                            
                            String username = 'demo'; 
                            String password = 'demo'; 
                            
                            if (username == 'demo' && password == 'demo') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PreVerifyByNumberPage(),
                                ),
                              );
                              setState(() {
                                loginStatus = '';
                              });
                      
                            } else {
                              setState(() {
                                loginStatus = languageProvider.currentLanguage['Username or password is incorrect']!;
                              });
                            }
                            FocusScope.of(context).unfocus();
                          },
                          child: Text(languageProvider.currentLanguage['Sign In']!),
                        ),
                        const SizedBox(height: 15),
                        languageProvider.currentLanguage['language']! == 'th'
                        ? 
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 2,
                                color: Colors.grey.shade300,
                              ),
                              const Spacer(),
                              Text(languageProvider.currentLanguage["Don't have an account?"]!,style: TextStyle(color: Colors.grey.shade500),),
                              const Spacer(),
                              Container(
                                width: 120,
                                height: 2,
                                color: Colors.grey.shade300,
                              )
                            ],
                          ),
                        )
                        :
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 2,
                                color: Colors.grey.shade300,
                              ),
                              const Spacer(),
                              Text(languageProvider.currentLanguage["Don't have an account?"]!,style: TextStyle(color: Colors.grey.shade500),),
                              const Spacer(),
                              Container(
                                width: 100,
                                height: 2,
                                color: Colors.grey.shade300,
                              )
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: () {
                            // เพิ่มการดำเนินการเมื่อผู้ใช้กด "เปิดบัญชีเพื่อลงทะเบียนบัญชีผู้ใช้"
                          },
                          child: Text(languageProvider.currentLanguage['Sign up to create a user account']!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
