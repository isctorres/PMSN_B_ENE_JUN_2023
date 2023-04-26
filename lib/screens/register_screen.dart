import 'dart:io';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pmsnb1/firebase/email_auth.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  String? imagePath;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final floatingActionButton = FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 34, 129, 91),
      onPressed: () {
        _showSelectionDialog(context);
      },
      // ignore: prefer_const_constructors
      child: Icon(Icons.camera_alt),
    );
    // ignore: prefer_const_constructors
    final spaceHorizontal = SizedBox(
      height: 15,
    );


    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fondo_itcelaya.jpeg'),
                    fit: BoxFit.cover,
                    opacity: 0.4)),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                key: _formKey,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      spaceHorizontal,
                      floatingActionButton,
                      const MyCustomForm()
                    ],
                  ),
                ],
              ),
            ),
          ),
          (imagePath == null) ? Container() : Image.file(File(imagePath!))
        ],
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: const Text("Gallery"),
                      onTap: () {
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: const Text("Camera"),
                      onTap: () {
                      },
                    )
                  ],
                ),
              ));
        });
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  EmailAuth emailAuth = EmailAuth();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtName = TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Inserte su Nombre',
        labelText: 'Nombre',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );

    final txtEmail = TextFormField(
      controller: conEmail,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'Inserte su email',
        labelText: 'Email',
      ),
      validator: (value) {
        
      },
    );

    final txtPass = TextFormField(
      controller: conPass,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Inserte su contraseña',
        labelText: 'Contraseña',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );

    // ignore: prefer_const_constructors
    final spaceHorizontal = SizedBox(
      height: 15,
    );

    final btnRegister = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            emailAuth.createUserWithEmailAndPassword(
              email: conEmail.text, password: conPass.text);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        });
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          spaceHorizontal,
          txtName,
          spaceHorizontal,
          txtEmail,
          spaceHorizontal,
          txtPass,
          spaceHorizontal,
          btnRegister,
        ],
      ),
    );
  }
}