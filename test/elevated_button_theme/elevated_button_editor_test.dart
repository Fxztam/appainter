import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Elevated Button');

  late AdvancedThemeCubit advancedThemeCubit;
  late ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    advancedThemeCubit = MockAdvancedThemeCubit();
    elevatedButtonThemeCubit = MockElevatedButtonThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => advancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() {
      return elevatedButtonThemeCubit.state;
    }).thenReturn(const ElevatedButtonThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    ElevatedButtonThemeState state,
  ) async {
    whenListen(
      elevatedButtonThemeCubit,
      Stream.fromIterable([const ElevatedButtonThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: advancedThemeCubit),
          BlocProvider.value(value: elevatedButtonThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const ElevatedButtonThemeEditor()),
        ),
      ),
    );
  }

  group('test background color', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_backgroundColor_default',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_backgroundColor_disabled',
          color,
        );
      },
    );
  });

  group('test foreground color', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(foregroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_foregroundColor_default',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(foregroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_foregroundColor_disabled',
          color,
        );
      },
    );
  });

  group('test overlay color', () {
    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_overlayColor_hovered',
          color,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_overlayColor_focused',
          color,
        );
      },
    );

    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_overlayColor_pressed',
          color,
        );
      },
    );
  });

  group('shadow color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(
            style: ButtonStyle(shadowColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonThemeEditor_shadowColor_default',
          color,
        );
      },
    );
  });

  group('test elevation', () {
    testWidgets(
      'default text field should update with value',
      (tester) async {
        final prop = getMaterialStateProperty({null: doubleValue});
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(style: ButtonStyle(elevation: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonThemeEditor_elevationTextField_default',
          doubleValue,
        );
      },
    );

    testWidgets(
      'disabled text field should update with value',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: doubleValue,
        });
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(style: ButtonStyle(elevation: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonThemeEditor_elevationTextField_disabled',
          doubleValue,
        );
      },
    );

    testWidgets(
      'hovered text field should update with value',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: doubleValue,
        });
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(style: ButtonStyle(elevation: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonThemeEditor_elevationTextField_hovered',
          doubleValue,
        );
      },
    );

    testWidgets(
      'focused text field should update with value',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: doubleValue,
        });
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(style: ButtonStyle(elevation: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonThemeEditor_elevationTextField_focused',
          doubleValue,
        );
      },
    );

    testWidgets(
      'pressed text field should update with value',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: doubleValue,
        });
        final state = ElevatedButtonThemeState(
          theme: ElevatedButtonThemeData(style: ButtonStyle(elevation: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonThemeEditor_elevationTextField_pressed',
          doubleValue,
        );
      },
    );
  });
}
