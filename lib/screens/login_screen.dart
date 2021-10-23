import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:guarderpet_mobile/components/loader_component.dart';
import 'package:guarderpet_mobile/models/token.dart';
import 'package:guarderpet_mobile/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:guarderpet_mobile/helpers/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String emailError = '';
  bool emailshowError = false;
  String password = '';
  String passError = '';
  bool passShowError = false;
  bool remember = true;
  bool passVisible = false;
  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _showLogo(),
            _showEmail(),
            _showPassword(),
            _showRememberMe(),
            _showButtons(),
          ]),
          showLoader
              ? loaderComponent(text: 'Un momento por favor...')
              : Container(),
        ],
      ),
    );
  }

  Widget _showLogo() {
    return const Image(
      image: AssetImage('assets/titledLogo.png'),
      width: 200,
    );
  }

  Widget _showEmail() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: const TextStyle(height: 2.5),
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            errorText: emailshowError ? emailError : null,
            hintText: 'example@example.com',
            labelText: 'Email',
            suffixIcon: const Icon(Icons.email),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: (value) {
          email = value;
        },
      ),
    );
  }

  Widget _showPassword() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        obscureText: !passVisible,
        decoration: InputDecoration(
            errorText: passShowError ? passError : null,
            hintText: 'Contraseña',
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  passVisible = !passVisible;
                });
              },
              icon: !passVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: (value) {
          password = value;
        },
      ),
    );
  }

  Widget _showRememberMe() {
    return CheckboxListTile(
        title: const Text('Recordar datos'),
        value: remember,
        onChanged: (value) {
          setState(() {
            remember = value!;
          });
        });
  }

  Widget _showButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('Registrarse'),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50), primary: Color(0xFFBD1616)),
        ),
        ElevatedButton(
          onPressed: () => login(),
          child: const Text('Ingresar'),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50), primary: Colors.red),
        ),
      ],
    );
  }

  void login() async {
    setState(() {
      passVisible = false;
    });
    if (!validateFields()) {
      return;
    }

    setState(() {
      showLoader = true;
    });

    Map<String, dynamic> request = {
      'username': email,
      'password': password,
    };

    var url = Uri.parse('${Constants.apiURL}/api/Account/CreateToken');
    var response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
        body: jsonEncode(request));
    setState(() {
      showLoader = false;
    });

    if (response.statusCode >= 400) {
      setState(() {
        passShowError = true;
        passError = 'Email o contraseña incorrectos.';
      });
      return;
    }

    var body = response.body;
    var decodedJson = jsonDecode(body);
    var token = Token.fromJson(decodedJson);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  token: token,
                )));
  }

  bool validateFields() {
    bool isValid = true;

    if (email.isEmpty) {
      isValid = false;
      emailshowError = true;
      emailError = 'Ingrese un email por favor';
    } else if (!EmailValidator.validate(email)) {
      isValid = false;
      emailshowError = true;
      emailError = 'Ingrese un email valido';
    } else {
      isValid = true;
      emailshowError = false;
      emailError = '';
    }

    if (password.isEmpty) {
      isValid = false;
      passShowError = true;
      passError = 'Debes ingresar una contraseña';
    } else if (!EmailValidator.validate(email)) {
      isValid = false;
      passShowError = true;
      passError = 'Ingresa una contraseña de al menos 6 caracteres';
    } else {
      isValid = true;
      passShowError = false;
      passError = '';
    }
    setState(() {});
    return isValid;
  }
}
