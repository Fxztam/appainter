import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

Future<void> main() async {
  final widget = MyExpansionPanelList(item: const OutlinedButtonEditor());
  final _widgetTesters = WidgetTesters(expandText: 'Outlined Button');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(widget, advancedThemeCubit: cubit);
  }

  testWidgets('should display OutlinedButtonEditor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(OutlinedButtonEditor), findsOneWidget);
  });

  group('background color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(backgroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_backgroundColor_default',
          color,
        );
      },
    );
  });

  group('foreground color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(foregroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_foregroundColor_default',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(foregroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_foregroundColor_disabled',
          color,
        );
      },
    );
  });

  group('overlay color pickers', () {
    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_overlayColor_hovered',
          color,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_overlayColor_focused',
          color,
        );
      },
    );

    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_overlayColor_pressed',
          color,
        );
      },
    );
  });

  group('shadow color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(shadowColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonEditor_shadowColor_default',
          color,
        );
      },
    );
  });

  group('elevation text fields', () {
    testWidgets(
      'default text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({null: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'outlinedButtonEditor_elevationTextField_default',
          value,
        );
      },
    );
  });
}