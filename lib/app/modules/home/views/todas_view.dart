import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodasView extends GetView<HomeController> {
  const TodasView({Key? key}) : super(key: key);
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
          // TODO: identificar se está ocupado ou não, pra mudar acor
          return CardOcupacao(
            name: '1',
            color: Colors.black,
            onTap: () {
              debugPrint('tap');
            },
          );
        },
      ),
    );
  }
}
