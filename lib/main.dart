import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'editor.dart';

void main() {
  U8App.initiate();

  runApp(
    ProviderScope(
      child: SimpleDemoEditor(),
    ),
  );
}
