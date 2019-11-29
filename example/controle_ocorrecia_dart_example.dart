import 'dart:io';

import 'package:controle_ocorrecia_dart/controle_ocorrecia_dart.dart';

int menu() {
  print('### Controle de Ocorrências ###');
  print('Digite uma opção');
  print('0. Sair');
  print('1. Inserir');
  print('2. Excluir');
  print('3. Atualizar');
  print('4. Listar');
  var val = stdin.readLineSync();
  return int.parse(val);
}

main() {
  int sair;
  do {
    sair = menu();
    switch (sair) {
      case 0:
        print('saindo....');
        break;
      case 1:
        print('inserindo....');
        break;
      case 2:
        print('excluindo....');
        break;
      case 3:
        print('atualizando....');
        break;
      case 4:
        print('listando....');
        break;

      default:
        print('opção inválida....');
    }
  } while (sair != 0);

  // var awesome = Awesome();
  // print('awesome: ${awesome.isAwesome}');
  // print("What's your name?");
  // var name = stdin.readLineSync();
  // print("How are you $name, today?");
}
