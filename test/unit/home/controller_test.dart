import 'package:estacionamento/app/data/models/vaga_model.dart';
import 'package:estacionamento/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../mocks/vaga_mock.dart';

void main() {
  test(
      'O método addNewEntrada() uma placa válida deve me retornar um Objeto do tipo VagaModel',
      () {
    final controller = Get.put(HomeController());
    const placa = 'MUM-3331';
    final resultadoObtido = controller.validarPlaca(placa);
    expect(resultadoObtido, null);
    expect(controller.addNewEntrada(placa).runtimeType, VagaModel);
  });
  test('O método addNewEntrada() deve atribuir a enterAt a data atual.', () {
    final controller = Get.put(HomeController());
    const placa = 'MUM-3331';
    final resultadoObtido = controller.validarPlaca(placa);
    expect(resultadoObtido, null);
    final vaga = controller.addNewEntrada(placa);
    var dataDaEntradaDaVaga =
        DateTime(vaga.enterAt.year, vaga.enterAt.month, vaga.enterAt.day);
    var dataAtual = DateTime.now();
    var dataEsperada = DateTime(dataAtual.year, dataAtual.month, dataAtual.day);
    expect(dataDaEntradaDaVaga, dataEsperada);
  });
  test(
      'O método addNewEntrada() deve atribuir a enterAt a data, hora e minutos atuais',
      () {
    final controller = Get.put(HomeController());
    const placa = 'MUM-3331';
    final resultadoObtido = controller.validarPlaca(placa);
    expect(resultadoObtido, null);
    final vaga = controller.addNewEntrada(placa);
    var dataDaEntradaDaVaga = DateTime(vaga.enterAt.year, vaga.enterAt.month,
        vaga.enterAt.day, vaga.enterAt.hour, vaga.enterAt.minute);
    var dataAtual = DateTime.now();
    var dataEsperada = DateTime(dataAtual.year, dataAtual.month, dataAtual.day,
        dataAtual.hour, dataAtual.minute);
    expect(dataDaEntradaDaVaga, dataEsperada);
  });

  test(
      'O método marcarVagaComoSaida() uma placa válida deve me retornar um Objeto do tipo VagaModel',
      () {
    final controller = Get.put(HomeController());
    final vaga = vagaMock;
    final vagaObtida = controller.marcarVagaComoSaida(vaga);
    expect(vagaObtida.runtimeType, VagaModel);
  });
  test(
      'O método marcarVagaComoSaida() uma placa válida deve adicionar a vaga no array de saídas, e no array de histórico',
      () {
    final controller = Get.put(HomeController());
    final vaga = vagaMock;
    final vagaObtida = controller.marcarVagaComoSaida(vaga);
    expect(vagaObtida.runtimeType, VagaModel);
    expect(
        controller.vagasSaidas.any((element) => element == vagaObtida), true);
    expect(controller.vagasTodas.any((element) => element == vagaObtida), true);
  });
  test(
      'Ao marcar uma vaga como saida, essa será removida da lista de vagas de entradas',
      () {
    final controller = Get.put(HomeController());
    final vaga = vagaMock;
    controller.vagasEntradas.value = [vaga];
    expect(controller.vagasEntradas.length, 1);
    final vagaObtida = controller.marcarVagaComoSaida(vaga);
    expect(controller.vagasEntradas.any((element) => element == vagaObtida),
        false);
  });
  test(
      'Ao marcar uma vaga como finalizada, essa será removida da lista de vagas e adicionada ao historico',
      () {
    final controller = Get.put(HomeController());
    final vaga = vagaMock;
    controller.vagasSaidas.value = [vaga];
    expect(controller.vagasSaidas.length, 1);
    final vagaObtida = controller.marcarVagaFinalizada(vaga);
    expect(vagaObtida.finalized, true);
    expect(
        controller.vagasSaidas.any((element) => element == vagaObtida), false);
    expect(controller.vagasTodas.any((element) => element == vagaObtida), true);
  });
}
