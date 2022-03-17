import 'package:estacionamento/app/modules/home/views/entradas_view.dart';
import 'package:estacionamento/app/modules/home/views/saidas_view.dart';
import 'package:estacionamento/app/modules/home/views/todas_view.dart';
import 'package:estacionamento/app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.homeTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.labelEntrada, style: labelStyle),
            EntradasView(
              vagas: controller.vagasEntradas,
              onVagaPressed: controller.marcarVagaComoSaida,
              addNewEntradaAction: controller.addNewEntrada,
            ),
            Text(Strings.labelSaida, style: labelStyle),
            SaidasView(
              vagas: controller.vagasSaidas,
              onVagaPressed: controller.marcarVagaFinalizada,
            ),
            Text(Strings.labelHistorico, style: labelStyle),
            TodasView(
              vagas: controller.vagasTodas,
            ),
          ],
        ),
      ),
    );
  }
}
