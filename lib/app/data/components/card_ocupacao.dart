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
      child: SizedBox(
        height: 80,
        width: 80,
        child: Card(
            child: Icon(
          Icons.add,
          color: color,
        )),
      ),
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
      child: SizedBox(
        height: 80,
        width: 80,
        child: Card(
            color: color,
            child: Center(
                child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ))),
      ),
    );
  }
}
