class Usuario {
  String uuid;
  String nome;
  int saldo;
  String senha;

  Usuario({this.uuid = '', this.nome = '', this.saldo = 1, this.senha = ""});

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'nome': nome,
      'saldo': saldo,
      'senha': senha,
    };
  }
}
