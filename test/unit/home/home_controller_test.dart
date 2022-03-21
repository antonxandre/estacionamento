import 'package:estacionamento/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test(
      'Ao injetar o controlador, deve ter o seu estado inicial com o array vagasEntradas vazio',
      () {
    HomeController controller = Get.put(HomeController());
    controller.onInit();
    final array = controller.vagasEntradas;
    final tamanhoArray = array.length;

    expect(tamanhoArray, 0);
  });
}
