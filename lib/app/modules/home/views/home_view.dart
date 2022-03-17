import 'package:estacionamento/app/modules/home/views/disponiveis_view.dart';
import 'package:estacionamento/app/modules/home/views/ocupadas_view.dart';
import 'package:estacionamento/app/modules/home/views/todas_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Disponíveis', style: Theme.of(context).textTheme.headline6),
            DisponiveisView(
              vagas: controller.vagasDisponiveis,
              onVagaPressed: controller.adicionarVagaDisponivel,
            ),
            Text(
              'Ocupadas',
              style: Theme.of(context).textTheme.headline6,
            ),
            OcupadasView(
              vagas: controller.vagasOcupadas,
              onVagaPressed: controller.adicionarVagaOcupada,
            ),
            Text(
              'Todas',
              style: Theme.of(context).textTheme.headline6,
            ),
            TodasView(
              vagas: controller.vagasTodas,
            ),
          ],
        ),
      ),
    );
  }
}
