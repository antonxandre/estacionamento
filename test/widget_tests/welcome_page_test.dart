import 'package:estacionamento/app/data/components/app_button.dart';
import 'package:estacionamento/app/routes/app_pages.dart';
import 'package:estacionamento/app/utils/theme/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets(
      'Ao entrar na tela de boas vindas, deve ter um texto de boas vindas e um botão para entrar',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      title: "Estacionamento",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    ));

    // Busca os textos e o botão de entrar
    final titleTxtFinder =
        find.text('Bem vindo(a)!\n Toque em "Entrar" para continuar.');
    final buttonTxtFinder = find.text('Entrar');
    final buttonFinder = find.byType(AppButton);

    expect(titleTxtFinder, findsOneWidget);
    expect(buttonTxtFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  // Teste de rota
  testWidgets(
      'Ao tocar no botão de entrar, o usuário deve ser redirecionado para tela inicial',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      title: "Estacionamento",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    ));
    // usuário pressiona no botão "Entrar"
    await tester.tap(find.byType(AppButton));

    await tester.pump();
    // usuário deve estar na home.
    expect(Get.currentRoute, '/home');
  });
}
