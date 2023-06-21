import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal2d/apps/diagram.dart';
import 'package:fractal2d/simple_diagram_editor/policy/my_policy_set.dart';
import 'package:u8/builders/list8.dart';

import 'areas/positioner.dart';

class U8App extends DiagramAppFractal {
  U8App({required super.policySet});

  static final provider = Provider<U8App>((ref) {
    final policy = MyPolicySet()..refer(ref);
    policy.builders['list8'] = (component) => List8Builder(component);
    return U8App(policySet: policy);
  });

  @override
  get positionerBuilder => () => const U8PositionerArea();

  static Future initiate() async {
    DiagramAppFractal.provider = provider;
  }
}
