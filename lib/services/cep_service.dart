import 'package:flutter_first/models/cep.dart';

abstract class CepService {
  Future<Cep> getCep(String cep);
}