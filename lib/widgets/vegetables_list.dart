import 'package:flutter/material.dart';
import 'package:training_task1/data/vegetables.dart';
import 'package:training_task1/widgets/vegetable_card.dart';

class VegetablesList extends StatelessWidget {
  const VegetablesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 500,
        child: ListView.builder(
            itemCount: vegetables.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: VegetableCard(vegetable: vegetables[index]))),
      ),
    );
  }
}
