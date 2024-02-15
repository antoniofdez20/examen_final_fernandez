import 'package:examen_final_fernandez/models/arbre.dart';
import 'package:flutter/material.dart';

class ArbreCard extends StatelessWidget {
  final Arbre arbre;
  const ArbreCard({super.key, required this.arbre});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(arbre.nom),
      subtitle: Text(
        arbre.varietat,
        style: TextStyle(color: Colors.white.withOpacity(0.6)),
      ),
    );
  }
}
