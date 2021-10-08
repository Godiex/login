class Login {
  final String usuario;
  final String clave;
  final String acceso;

  Login({
    required this.usuario,
    required this.clave,
    required this.acceso,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      usuario: json['usuario'],
      clave: json['clave'],
      acceso: json['acceso'],
    );
  }
}
