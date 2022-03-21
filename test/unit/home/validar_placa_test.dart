import 'package:estacionamento/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = HomeController();
  test(
      'No método validarPlaca() com MUM-3331, deve ser válido e não retornar mensagem de erro. ',
      () {
    final resultadoObtido = controller.validarPlaca('MUM-3331');
    expect(resultadoObtido, null);
  });
  test(
      'No método validarPlaca() com LRX-5817, deve ser válido e não retornar mensagem de erro. ',
      () {
    final resultadoObtido = controller.validarPlaca('LRX-5817');
    expect(resultadoObtido, null);
  });
  test(
      'No método validarPlaca() com BRA-2502, deve ser válido e não retornar mensagem de erro. ',
      () {
    final resultadoObtido = controller.validarPlaca('BRA-2502');
    expect(resultadoObtido, null);
  });
  test(
      'No método validarPlaca() com RFC-7875, deve ser válido e não retornar mensagem de erro. ',
      () {
    final resultadoObtido = controller.validarPlaca('RFC-7875');
    expect(resultadoObtido, null);
  });
  test(
      'No método validarPlaca() com HEF-9850, deve ser válido e não retornar mensagem de erro. ',
      () {
    final resultadoObtido = controller.validarPlaca('HEF-9850');
    expect(resultadoObtido, null);
  });
  test(
      'No método validarPlaca() com MUM-ABCD, deve ser inválido e deve retornar uma mensagem de erro.',
      () {
    final resultadoObtido = controller.validarPlaca('MUM-ABCD');
    expect(resultadoObtido, 'Placa inválida');
  });
  test(
      'No método validarPlaca() com 123-ABCD, deve ser inválido e deve retornar uma mensagem de erro.',
      () {
    final resultadoObtido = controller.validarPlaca('123-ABCD');
    expect(resultadoObtido, 'Placa inválida');
  });
  test(
      'No método validarPlaca() com AB12, deve ser inválido e deve retornar uma mensagem de erro.',
      () {
    final resultadoObtido = controller.validarPlaca('AB12');
    expect(resultadoObtido, 'Placa inválida, insira 8 digitos.');
  });
}
