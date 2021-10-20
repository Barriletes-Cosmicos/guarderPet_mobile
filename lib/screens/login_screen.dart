import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showLogo(),
          _showEmail(),
          _showPassword(),
          _showRememberMe(),
          _showButtons(),
        ],
      )),
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

  void login() {
    if (!validateFields()) {
      return;
    }
  }

  bool validateFields() {
    bool hasError = false;

    if (email.isEmpty) {
      hasError = true;
      emailshowError = true;
      emailError = 'Ingrese un email por favor';
    } else if (!EmailValidator.validate(email)) {
      hasError = true;
      emailshowError = true;
      emailError = 'Ingrese un email valido';
    } else {
      hasError = false;
      emailshowError = false;
      emailError = '';
    }

    if (password.isEmpty) {
      hasError = true;
      passShowError = true;
      passError = 'Debes ingresar una contraseña';
    } else if (!EmailValidator.validate(email)) {
      hasError = true;
      passShowError = true;
      passError = 'Ingresa una contraseña de al menos 6 caracteres';
    } else {
      hasError = false;
      passShowError = false;
      passError = '';
    }
    setState(() {});
    return hasError;
  }
}
