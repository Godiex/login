import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> usuarios(http.Client client, String user, String pass) async {
  final response = await http.post(
      Uri.parse(
          'https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/login.php'),
      body: {
        "idusuario": user,
        "pass": pass,
      });

  final pasar = json.decode(response.body);
  // print(pasar[0]['usuario']);
  guardarusuario(pasar[0]['usuario']);
}

Future<void> guardarusuario(datos) async {
  Future<SharedPreferences> _localuser = SharedPreferences.getInstance();
  final SharedPreferences localuser = await _localuser;
  localuser.setString('usuario', datos);
  print(localuser.getString('usuario'));
}
