import 'dart:convert';
import 'dart:developer';

import 'package:flutter_first/models/cep.dart';
import 'package:flutter_first/services/cep_service.dart';
import 'package:http/http.dart';

class CepServiceImpl implements CepService {

  @override
  Future<Cep> getCep(String cep) async {
    Uri uri = Uri.https("viacep.com.br", "/ws/$cep/json");
    try {
      Response response = await get(uri);
      return Cep.fromMap(jsonDecode(response.body));
    } catch (e) {
      log("Erro ao buscar CEP", error: e);
      throw Exception("Erro ao buscar CEP");
    }
  }
  
}