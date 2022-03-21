import 'package:estacionamento/app/utils/formatters.dart';
import 'package:estacionamento/app/utils/strings.dart';
import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
      child: Obx(() => vagas.isEmpty
          ? const Center(child: Text(Strings.historicoVazio))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vagas.length,
              itemBuilder: (_, index) {
                final vaga = vagas[index];
                return _buildItemHistoric(vaga);
              })),
    );
  }

  Card _buildItemHistoric(VagaModel vaga) {
    return Card(
      child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              vaga.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
              '${formatYmdHmDate(vaga.enterAt)}\n${formatYmdHmDate(vaga.leftAt)}\n'),
          trailing: vaga.hasLeft && !vaga.finalized
              ? const Icon(
                  Icons.arrow_right,
                  color: AppTheme.success,
                )
              : vaga.finalized
                  ? const Icon(
                      Icons.check_circle,
                      color: AppTheme.primary,
                    )
                  : const Icon(
                      Icons.arrow_left,
                      color: AppTheme.error,
                    )),
    );
  }
}
