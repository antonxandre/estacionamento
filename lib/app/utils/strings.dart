import 'package:estacionamento/app/utils/constants.dart';

class Strings {
  // Labels
  static const homeTitle = 'Estacionamento';
  static const labelEntrada = 'Entradas';
  static const labelSaida = 'Saídas';
  static const labelHistorico = 'Histórico';
  static const welcomeLabelText =
      'Bem vindo(a)!\n Toque em "Entrar" para continuar.';

  // Botões
  static const entrarButtonText = 'Entrar';
  // Dialogos
  static const tituloDialogoEntrada = 'Adicionar uma vaga de entrada?';
  static const tituloDialogoSaida =
      'Deseja realmente marcar e adicionar essa vaga como saída?';

  // Inputs
  static const placaLabelInput = 'Placa do veículo';
  static const examplePlaca = 'Exemplo: MUM-3111';

  // Empty vagas
  static const historicoVazio = 'Não há vagas no histórico';
  static const saidasVazio = 'Não há vagas em saídas';

  // Texts
  static const requiredTxtLbl = 'Obrigatório';
  static const noDateFound = 'Sem data';
  static const validatePlacaLength =
      'Placa inválida, insira ${Constants.TAMANHO_DA_PLACA} digitos.';
  static const placaInvalid = 'Placa inválida';
}
