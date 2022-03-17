import 'package:estacionamento/app/data/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/models/vaga_model.dart';

class TodasView extends StatelessWidget {
  final RxList<VagaModel> vagas;
  const TodasView({
    Key? key,
    required this.vagas,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      child: Obx(
        () => Wrap(
          children: vagas
              .map<Widget>((e) => CardOcupacao(
                    name: e.name,
                    color: e.occupied ? AppTheme.error : AppTheme.success,
                    onTap: () {
                      debugPrint('tapp ');
                      // swap();
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
