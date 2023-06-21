import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal2d/diagram_editor.dart';
import 'package:fractal2d/providers/positioner.dart';
import 'package:fractal2d/simple_diagram_editor/data/custom_component_data.dart';
import 'package:xc8/app.dart';

import '../app.dart';

class U8PositionerArea extends ConsumerWidget {
  const U8PositionerArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positioner = ref.watch(Positioner.provider.notifier);
    final position = ref.watch(Positioner.provider);

    final app = ref.read(U8App.provider);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white.withAlpha(120),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                app.putImage(position);
                positioner.reset();
              },
              icon: const Icon(
                Icons.image,
              ),
            ),
            IconButton(
              onPressed: () async {
                const size = Size(400, 400);

                final pos = Offset(
                  position.x - size.width / 2,
                  position.y,
                );

                final data = ComponentData(
                  size: size,
                  data: MyComponentData(
                    color: Colors.grey,
                    borderWidth: 0.0,
                  ),
                  type: 'list8',
                  position: app.policySet.state.fromCanvasCoordinates(
                    pos,
                  ),
                );
                app.policySet.model.addComponent(data);

                positioner.reset();
              },
              icon: const Icon(
                Icons.list,
              ),
            ),
          ],
        ),
        Expanded(
          child: Oo8App(),
        ),
      ]),
    );
  }
}
