import 'package:examen_final_fernandez/controllers/arbres_controller.dart';
import 'package:examen_final_fernandez/controllers/login_controller.dart';
import 'package:examen_final_fernandez/widgets/arbre_card.dart';
import 'package:examen_final_fernandez/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final arbreController = Get.put(ArbreController());
    final arbres = arbreController.arbres;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              controller.resetCredencials();
              Get.offNamed('/login');
            },
          ),
        ],
      ),
      body: arbres.isEmpty
          ? loading()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: ListView.builder(
                  itemCount: arbres.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      child: GestureDetector(
                        child: ArbreCard(arbre: arbres[index]),
                        onTap: () {
                          arbreController.arbreAux.value = arbres[index];
                          Get.toNamed('/details');
                        },
                      ),
                      onDismissed: (direction) {
                        if (arbres.length < 2) {
                          arbreController.loadArbres();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'No es pot esborrar tots els elements!')));
                        } else {
                          //arbreController.deleteUser(arbres[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('${arbres[index].nom} esborrat')));
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
    );
  }
}
