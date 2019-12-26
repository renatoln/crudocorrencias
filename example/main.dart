import 'dart:io';

import 'package:controle_ocorrecia_dart/controle_ocorrecia_dart.dart';
import 'dart:convert';

int menu() {
  //limparTela();
  print('### Controle de Ocorrências ###');
  print('Digite uma opção');
  print('0. Salvar e Sair');
  print('1. Inserir');
  print('2. Excluir');
  print('3. Atualizar');
  print('4. Listar');
  var val = stdin.readLineSync();
  return int.parse(val);
}

void inserirOcorrencia(List<Ocorrencia> lista) {
  print('Digite a ocorrência');
  String description = stdin.readLineSync();
  Ocorrencia oco = Ocorrencia(description);
  lista.add(oco);
  print('Item inserido com sucesso');
}

void excluirOcorrencia(List<Ocorrencia> lista) {
  print('Digite o id da Ocorrência');
  int id = int.parse(stdin.readLineSync());
  bool deletado = false;
  for (var oco in lista) {
    if (oco.id == id) {
      lista.remove(oco);
      deletado = true;
      break;
    }
  }
  if (deletado) {
    print('Item deletado com sucesso');
  } else {
    print('Ocorrência não encontrada');
  }
}

void atualizarOcorrencia(List<Ocorrencia> lista) {
  print('Digite o id da Ocorrência');
  int id = int.parse(stdin.readLineSync());
  bool achou = false;

  for (var oco in lista) {
    if (oco.id == id) {
      print('Digite a nova descrição da Ocorrência');
      String description = stdin.readLineSync();
      oco.description = description;
      achou = true;
      break;
    }
  }
  if (achou) {
    print('Item atualizado com sucesso');
  } else {
    print('Ocorrência não encontrada');
  }
}

void limparTela() {
  for (int i = 0; i < stdout.terminalLines; i++) {
    stdout.writeln();
  }
}

main() {
  int sair;
  List<Ocorrencia> listaOcorrencias = List();
  carregarDados(listaOcorrencias);
  do {
    sair = menu();
    switch (sair) {
      case 0:
        salvar(listaOcorrencias);
        print('saindo....');
        break;
      case 1:
        print('inserindo....');
        inserirOcorrencia(listaOcorrencias);
        break;
      case 2:
        print('excluindo....');
        excluirOcorrencia(listaOcorrencias);
        break;
      case 3:
        print('atualizando....');
        atualizarOcorrencia(listaOcorrencias);
        break;
      case 4:
        print('listando....');
        print(listaOcorrencias);
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

void salvar(List<Ocorrencia> lista) {
  var jsonText = jsonEncode(lista);
  //print(jsonText);

  final filename = 'file.txt';
  File(filename).writeAsString(jsonText).then((File file) {
    // Do something with the file.
  });
}

void carregarDados(List<Ocorrencia> lista) {
  var config = File('file.txt');
  var contents;

  // Put the whole file in a single string.
  contents = config.readAsStringSync();
  if (contents != "[]") {
    List myList = jsonDecode(contents);
    myList.forEach((element) => lista.add(Ocorrencia.fromJson(element)));
    /* @TODO o id da ocorrencia deveria estar salvo em algum arquivo*/
    Ocorrencia.idCount = myList.length;
  }
}
