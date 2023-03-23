import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SaveCepRequest {
  String cep;

  SaveCepRequest(this.cep);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
    };
  }

  factory SaveCepRequest.fromMap(Map<String, dynamic> map) {
    return SaveCepRequest(
      map['cep'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaveCepRequest.fromJson(String source) => SaveCepRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
