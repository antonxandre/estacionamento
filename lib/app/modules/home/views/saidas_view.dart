import 'package:estacionamento/app/utils/strings.dart';
import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/models/vaga_model.dart';

import 'package:get/get.dart';

class SaidasView extends StatelessWidget {
  final color = AppTheme.success;
  final RxList<VagaModel> vagas;
  final Function(VagaModel vaga) onVagaPressed;

  const SaidasView({
    Key? key,
    required this.vagas,
    required this.onVagaPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
        child: Obx(() => vagas.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(Strings.saidasVazio),
              ))
            : Wrap(
                children: vagas
                    .map<Widget>((e) => CardOcupacao(
                          name: e.name,
                          color: color,
                          onTap: () => onVagaPressed(e),
                        ))
                    .toList())));
  }
}
