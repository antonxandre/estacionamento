import 'package:flutter/material.dart';

import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/models/vaga_model.dart';
import 'package:estacionamento/app/data/theme/app_theme.dart';
import 'package:get/get.dart';

class DisponiveisView extends StatelessWidget {
  final color = AppTheme.success;
  final Function([VagaModel vaga]) onVagaPressed;

  final RxList<VagaModel> vagas;
  const DisponiveisView({
    Key? key,
    required this.vagas,
    required this.onVagaPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
        child: Obx(() => Wrap(
              children: [
                CardOcupacaoNew(
                  color: color,
                  onTap: onVagaPressed,
                ),
                ...vagas
                    .map<Widget>((e) => CardOcupacao(
                          name: e.name,
                          color: color,
                          onTap: () => onVagaPressed(e),
                        ))
                    .toList()
              ],
            )));
  }
}
