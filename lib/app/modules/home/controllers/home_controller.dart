import 'package:estacionamento/app/data/models/vaga_model.dart';
import 'package:estacionamento/app/data/repositories/vaga_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final vagasDisponiveis = <VagaModel>[].obs;
  final vagasOcupadas = <VagaModel>[].obs;
  final vagasTodas = <VagaModel>[].obs;
  final _vagaRepository = VagaRepository();

  @override
  void onInit() {
    vagasDisponiveis.value = _vagaRepository.findDisponiveis();
    vagasOcupadas.value = _vagaRepository.findOcupados();
    vagasTodas.addAll(vagasDisponiveis);
    vagasTodas.addAll(vagasOcupadas);
    super.onInit();
  }

  adicionarVagaDisponivel([VagaModel? vaga]) {
    vagasDisponiveis.add(vagasDisponiveis.first);

    // add em todos
  }

  adicionarVagaOcupada([VagaModel? vaga]) {
    vagasOcupadas.add(vagasDisponiveis.first);
    // add em todos
  }
}
