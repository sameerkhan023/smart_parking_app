import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(child: ListTile(title: Text('Vehicle Card')));
  }
}
