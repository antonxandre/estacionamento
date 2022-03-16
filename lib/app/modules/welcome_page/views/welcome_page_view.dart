import 'package:estacionamento/app/data/components/app_button.dart';
import 'package:estacionamento/app/data/theme/app_theme.dart';
import 'package:estacionamento/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePageView extends GetView {
  const WelcomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _buildWelcomeTitle(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildFAB(),
        ),
      ),
    );
  }

  Text _buildWelcomeTitle() => const Text(
        'Bem vindo(a)!\n Toque em "Entrar" para continuar.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.primary,
          fontWeight: FontWeight.w400,
          fontSize: 28,
        ),
      );

  AppButton _buildFAB() => AppButton(
        text: 'Entrar',
        onTap: () => Get.offNamed(Routes.HOME),
      );
}
