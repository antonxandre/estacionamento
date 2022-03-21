import 'package:estacionamento/app/data/components/card_ocupacao.dart';
import 'package:estacionamento/app/data/components/text_inputs.dart';
import 'package:estacionamento/app/routes/app_pages.dart';
import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets(
      'Ao entrar na home, deve ter um botão para adicionar uma nova entrada de vaga',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      title: "Estacionamento",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    ));

    final finder = find.byType(CardOcupacaoNew);

    expect(finder, findsOneWidget);
  });
  testWidgets(
      'Ao tocar no botão de uma nova vaga, deve mostrar um dialog com um campo de texto placa',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      title: "Estacionamento",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    ));
    await tester.tap(find.byType(CardOcupacaoNew));
    await tester.pump();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(InputTextFormFieldApp), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));
  });
}
