import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestIconThemeCubit extends AbstractIconThemeCubit {}

class MockIconThemeCubit extends MockCubit<IconThemeState>
    implements TestIconThemeCubit {}

class TestIconThemeEditor extends AbstractIconThemeEditor<TestIconThemeCubit> {
  const TestIconThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Test';
}
