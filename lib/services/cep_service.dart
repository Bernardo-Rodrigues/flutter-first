import 'package:flutter_first/models/cep.dart';

abstract class CepService {
  save(String cep);
  Future<Iterable<Cep>> getAll();
}