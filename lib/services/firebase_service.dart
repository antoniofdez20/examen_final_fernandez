import 'package:get/get.dart';

class FirebaseService extends GetConnect {
  final String _baseUrl =
      "https://examen-antoniopmm-default-rtdb.europe-west1.firebasedatabase.app";

  // Método para leer datos
  Future<Map<String, dynamic>> readData(String path) async {
    // Asegúrate de que la ruta a la que haces la petición termina en `.json`
    final response = await get('$_baseUrl/$path');
    if (response.status.hasError) {
      // Si hay un error, manejarlo aquí
      return Future.error(response.statusText!);
    } else {
      // Asegúrate de que el cuerpo de la respuesta no es nulo antes de hacer el cast
      if (response.body != null) {
        return response.body;
      } else {
        return {};
      }
    }
  }
}
