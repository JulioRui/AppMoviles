import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:julioruizapp/screens/home.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final email = TextEditingController();
  final clave = TextEditingController();
  String emailText = '';
  String passwordText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: SvgPicture.asset(
                'assets/imgs/logo.svg',
                height: 250.0,
              ),
            ),
            Column(
              children: [
                Text('English Words',
                    style: Theme.of(context).textTheme.headline1),
                Text('Inicie sesión',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(
                        CupertinoIcons.mail,
                      ),
                      hintText: 'ejemplo@email.co',
                      labelText: 'Correo Electrónico',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: clave,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(
                        CupertinoIcons.lock_fill,
                      ),
                      hintText: 'Clave de 8 dígitos',
                      labelText: 'Contraseña',
                      iconColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              elevation: 10.0,
              minWidth: 300.0,
              height: 50.0,
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text('Ingresar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              onPressed: () {
                emailText = email.text;
                passwordText = clave.text;
                if (emailText == 'juruva' && passwordText == '00000000') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Home();
                  }));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Usuario o contraseña incorrectos'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const [
                              Text('Verifica tus datos'),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                              child: const Text('Aceptar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
