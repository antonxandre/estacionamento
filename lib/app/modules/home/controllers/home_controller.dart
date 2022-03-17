import 'package:estacionamento/app/data/models/vaga_model.dart';
import 'package:estacionamento/app/data/repositories/vaga_repository.dart';
import 'package:estacionamento/app/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final vagasEntradas = <VagaModel>[].obs;
  final vagasSaidas = <VagaModel>[].obs;
  final vagasTodas = <VagaModel>[].obs;
  final _vagaRepository = VagaRepository();

  @override
  void onInit() {
    vagasEntradas.value = _vagaRepository.findDisponiveis();
    vagasSaidas.value = _vagaRepository.findOcupados();
    super.onInit();
  }

  /// Método responsável por adicionar uma vaga em entradas
  /// setando o horario de entrada.
  VagaModel addNewEntrada(String placa) {
    debugPrint(placa);
    final vaga = VagaModel(
      name: placa,
      hasLeft: false,
      finalized: false,
      enterAt: DateTime.now(),
      leftAt: null,
    );
    vagasEntradas.add(vaga);
    vagasTodas.add(vaga);

    //retornar obj sem mutacao
    return vaga;
  }

  /// Método responsável por remover uma vaga que estava marcada como entrada
  /// e atualizar como Saida setando o horario de saída.
  VagaModel marcarVagaComoSaida(VagaModel vaga) {
    vagasEntradas.remove(vaga);
    final newVaga = vaga.copyWith(
      hasLeft: true,
      leftAt: DateTime.now(),
    );
    // TODO: CONFIRM
    // TODO: REGISTRAR DATA
    // TODO: SEPARAR EM METODOS PARA TESTAR

    vagasSaidas.add(newVaga);
    vagasTodas.add(newVaga);
    //retornar objeto sem mutacao
    return newVaga;
  }

  marcarVagaFinalizada(VagaModel vaga) {
    vagasSaidas.remove(vaga);

    //SETAR HORA FIM E SALVAR NO HISTORICO COMO SAIDA
    // evita muatação vaga
    final newVaga = vaga.copyWith(finalized: true);
    vagasTodas.add(newVaga);
  }

  bool validarPlaca(placa) => placa.length == Constants.TAMANHO_DA_PLACA;
}
