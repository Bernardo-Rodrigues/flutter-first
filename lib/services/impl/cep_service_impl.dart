import 'dart:convert';
import 'dart:developer';

import 'package:flutter_first/models/cep.dart';
import 'package:flutter_first/models/save_cep_request.dart';
import 'package:flutter_first/services/cep_service.dart';
import 'package:http/http.dart';

class CepServiceImpl implements CepService {
  Uri uri = Uri.http("192.168.5.66:8080", "/ceps");

  @override
  save(String cep) async {
    try {
      await post(uri, body: cep);
    } catch (e) {
      log("Erro ao buscar CEP", error: e);
      throw Exception("Erro ao buscar CEP");
    }
  }
  
  @override
  Future <Iterable<Cep>> getAll() async {
    try {
      Response response = await get(uri);
      List<dynamic> ceps = jsonDecode(response.body);
      return ceps.map((cep) => Cep.fromMap(cep));
    } catch (e) {
      log("Erro ao buscar CEP", error: e);
      throw Exception("Erro ao buscar CEP");
    }
  }
  
}