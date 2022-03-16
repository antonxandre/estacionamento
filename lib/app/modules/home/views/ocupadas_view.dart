import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/theme/app_theme.dart';
import 'package:estacionamento/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OcupadasView extends GetView<HomeController> {
  const OcupadasView({Key? key}) : super(key: key);
  final color = AppTheme.error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 10 + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return CardOcupacaoNew(
              color: color,
              onTap: () {
                debugPrint('new Tap');
              },
            );
          }
          return CardOcupacao(
            name: '1',
            color: color,
            onTap: () {
              debugPrint('tapp ');
            },
          );
        },
      ),
    );
  }
}
