import 'package:flutter/material.dart';
import 'package:pmsnb1/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final txtEmail = TextFormField(
      decoration: const InputDecoration(
        label: Text('Email User'),
        enabledBorder: OutlineInputBorder()
      ),
    );

    final txtPass = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Password User'),
        enabledBorder: OutlineInputBorder()
      ),
    );

    final spaceHorizontal = SizedBox(height: 15,);

    final btnLogin = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin, 
      onPressed: (){
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 4000)).then((value){
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context,'/dash');
        });
      }
    );

    final btnGoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, 
      onPressed: (){}
    );

    final btnFacebook = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, 
      onPressed: (){}
    );

    final txtRegister = Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, '/register');
        }, 
        child: const Text('Crear cuenta :)', 
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline)
        )
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/fondo_itcelaya.jpeg'),
                opacity: .4, 
                fit: BoxFit.cover)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      txtEmail,
                      spaceHorizontal,
                      txtPass,
                      spaceHorizontal,
                      btnLogin,
                      spaceHorizontal,
                      const Text('or'),
                      spaceHorizontal,
                      btnGoogle,
                      spaceHorizontal,
                      btnFacebook,
                      spaceHorizontal,
                      txtRegister
                    ],
                  ),
                  Positioned(
                    top: 70,
                    child: Image.asset('assets/logo_itc.png', 
                      height: 250,
                    ),
                  )
                ],
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}