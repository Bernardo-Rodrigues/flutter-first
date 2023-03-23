import 'dart:convert';

class Cep {
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  Cep(this.logradouro, this.bairro, this.localidade, this.uf);


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory Cep.fromMap(Map<String, dynamic> map) {
    return Cep(
      map['logradouro'] as String,
      map['bairro'] as String,
      map['localidade'] as String,
      map['uf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cep.fromJson(String source) => Cep.fromMap(json.decode(source) as Map<String, dynamic>);
}
