import 'package:examen_final_fernandez/models/arbre.dart';
import 'package:examen_final_fernandez/services/firebase_service.dart';
import 'package:get/get.dart';

class ArbreController extends GetxController {
  final FirebaseService _firebaseRealtimeService = FirebaseService();
  RxList<Arbre> arbres = <Arbre>[].obs;
  Rx<Arbre> arbreAux = Arbre(
          nom: '',
          varietat: '',
          tipus: '',
          autocton: false,
          imageURL: '',
          detall: '')
      .obs;

  ArbreController() {
    loadArbres();
  }

  Future<void> loadArbres() async {
    arbres.clear();
    try {
      final response = await _firebaseRealtimeService.readData('arbres.json');

      if (response.isNotEmpty) {
        response.forEach((key, value) {
          final auxArbre = Arbre.fromMap(value);
          auxArbre.id = key;
          arbres.add(auxArbre);
        });
      }
    } catch (e) {
      // Manejar adecuadamente el error
      print('Error al cargar arboles: $e');
    }
  }
}
