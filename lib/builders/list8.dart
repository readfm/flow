import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal2d/diagram_editor.dart';
import 'package:xc8/app.dart';

class List8Builder extends ConsumerWidget {
  final ComponentData component;
  const List8Builder(this.component, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: component.data.color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Oo8App(),
    );
  }
}
