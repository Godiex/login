import 'package:ejemplo8_shared_perefences/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var usuarior;

  @override
  void initState() {
    super.initState();
    consultarusuario();
  }

  consultarusuario() async {
    Future<SharedPreferences> _localuser = SharedPreferences.getInstance();
    final SharedPreferences localuser = await _localuser;
    setState(() {
      usuarior = localuser.getString('usuario');
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usuario = TextEditingController();
    TextEditingController clave = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usuario,
                decoration: InputDecoration(hintText: "Digite el Usuario"),
              ),
              TextField(
                controller: clave,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite la Contraseña",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  consultarusuario();
                  setState(() {});
                  usuarios(http.Client(), usuario.text, clave.text);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Usuario Guardardo $usuarior')
            ],
          ),
        ),
      ),
    );
  }
}
