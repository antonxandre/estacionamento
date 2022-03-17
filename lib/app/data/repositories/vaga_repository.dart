import 'package:estacionamento/app/data/models/vaga_model.dart';

class VagaRepository {
  List<VagaModel> findDisponiveis() {
    return List.generate(
      18,
      (index) => VagaModel(
        id: index + 1,
        name: "${index + 1}",
        occupied: false,
        enterAtl: DateTime.now(),
        leftAt: DateTime.now(),
      ),
    );
  }

  List<VagaModel> findOcupados() {
    return List.generate(
      10,
      (index) => VagaModel(
        id: index + 10,
        name: "${index + 10}",
        occupied: true,
        enterAtl: DateTime.now(),
        leftAt: DateTime.now(),
      ),
    );
  }
}
