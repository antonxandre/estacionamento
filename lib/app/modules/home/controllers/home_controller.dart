import 'package:estacionamento/app/data/models/vaga_model.dart';
import 'package:estacionamento/app/data/repositories/vaga_repository.dart';
import 'package:estacionamento/app/utils/constants.dart';
import 'package:estacionamento/app/utils/strings.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final vagasEntradas = <VagaModel>[].obs;
  final vagasSaidas = <VagaModel>[].obs;
  final vagasTodas = <VagaModel>[].obs;
  final _vagaRepository = VagaRepository();

  final scrollController = Rxn<ScrollController>();
  final showTopButton = false.obs;

  @override
  void onInit() {
    scrollController.value = ScrollController()
      ..addListener(() {
        if (scrollController.value!.offset >= 300) {
          showTopButton.value = true;
        } else {
          showTopButton.value = false;
        }
      });
    super.onInit();
  }

  @override
  void onReady() {
    vagasEntradas.value = _vagaRepository.findDisponiveis();
    vagasSaidas.value = _vagaRepository.findOcupados();
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.value?.dispose();
    super.onClose();
  }

  scrollToTop() {
    scrollController.value?.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
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
    vagasSaidas.add(newVaga);
    vagasTodas.add(newVaga);
    //retornar objeto sem mutacao
    return newVaga;
  }

  VagaModel marcarVagaFinalizada(VagaModel vaga) {
    vagasSaidas.remove(vaga);
    // Evita muatação do obj
    final newVaga = vaga.copyWith(finalized: true);
    vagasTodas.add(newVaga);
    return newVaga;
  }

  /// O retorno desse método precisa ser nullable pois no input na view
  /// vai identificar como nulo e deixar a validação passar no submit.
  String? validarPlaca(String? placa) {
    var regraParaPlaca = RegExp(r'[A-Z]{3}[0-9][0-9A-Z][0-9]{2}');
    if (placa != null) {
      placa.toUpperCase();
      placa = placa.replaceAll('-', '');
      if (placa.length != Constants.TAMANHO_DA_PLACA - 1) {
        return Strings.validatePlacaLength;
      } else if (placa.isEmpty) {
        return Strings.requiredTxtLbl;
      } else if (!regraParaPlaca.hasMatch(placa)) {
        return Strings.placaInvalid;
      }
    }
  }
}
