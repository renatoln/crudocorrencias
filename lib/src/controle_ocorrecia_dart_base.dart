// TODO: Put public facing types in this file.

import 'package:controle_ocorrecia_dart/controle_ocorrecia_dart.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

//classe que representa uma ocorrência
class Ocorrencia {
  static int idCount = 0;
  int id;
  String description;
  TipoOcorrencia tipoOcorrencia;

  Ocorrencia(String description) {
    idCount++;
    id = idCount;
    this.description = description;
  }

  @override
  String toString() {
    return id.toString() + ' - ' + description;
  }

  // Ocorrencia.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       description = json['description'];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'description': description,
  //     };
}

class TipoOcorrencia {
  int id;
  String description;
}
