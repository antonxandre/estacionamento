import 'package:flutter/material.dart';

class CardOcupacaoNew extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const CardOcupacaoNew({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          child: Icon(
        Icons.add,
        color: color,
      )),
    );
  }
}

class CardOcupacao extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback onTap;

  const CardOcupacao({
    Key? key,
    required this.name,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: color,
          child: const Center(
              child: Text(
            '001',
            style: TextStyle(color: Colors.white),
          ))),
    );
  }
}
