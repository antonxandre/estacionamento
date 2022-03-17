import 'package:estacionamento/app/utils/strings.dart';
import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/components/dialogs.dart';
import 'package:estacionamento/app/data/components/text_inputs.dart';
import 'package:estacionamento/app/data/models/vaga_model.dart';

class EntradasView extends StatelessWidget {
  final color = AppTheme.error;
  final Function(VagaModel vaga) onVagaPressed;
  final Function(String) addNewEntradaAction;
  final RxList<VagaModel> vagas;
  const EntradasView({
    Key? key,
    required this.onVagaPressed,
    required this.addNewEntradaAction,
    required this.vagas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
        child: Obx(() => Wrap(
              children: [
                CardOcupacaoNew(
                  color: color,
                  onTap: _showDialog,
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

  _showDialog() {
    final placaTxtEditingController = TextEditingController();
    return Dialogs.showBooleanDialog(
      title: Strings.tituloDialogoEntrada,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputTextFormFieldApp(
            labelText: Strings.placaLabelInput,
            controller: placaTxtEditingController,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 8,
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
          ),
        ],
      ),
      action: () {
        addNewEntradaAction(placaTxtEditingController.text);
      },
    );
  }
}
