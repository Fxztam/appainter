import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/models/models.dart';

import '../utils.dart';

void main() {
  late AppBarThemeCubit cubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = AppBarThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(backgroundColor: color))];
    },
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit foreground color',
    build: () => cubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(foregroundColor: color))];
    },
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(elevation: doubleValue))];
    },
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit shadow color',
    build: () => cubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(shadowColor: color))];
    },
  );

  group('centerTitleChanged', () {
    for (var isCenter in [true, false]) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'should emit centerTitle=$isCenter',
        build: () => cubit,
        act: (cubit) => cubit.centerTitleChanged(isCenter),
        expect: () {
          return [AppBarThemeState(theme: AppBarTheme(centerTitle: isCenter))];
        },
      );
    }
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit title spacing',
    build: () => cubit,
    act: (cubit) => cubit.titleSpacingChanged(doubleValue.toString()),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(titleSpacing: doubleValue))];
    },
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'should emit tool bar height',
    build: () => cubit,
    act: (cubit) => cubit.toolBarHeightChanged(doubleValue.toString()),
    expect: () {
      return [AppBarThemeState(theme: AppBarTheme(toolbarHeight: doubleValue))];
    },
  );

  group('systemUiOverlayStyleChanged', () {
    for (var style in MySystemUiOverlayStyle().values) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'should emit ${style.statusBarBrightness}',
        build: () => cubit,
        act: (cubit) {
          cubit.systemUiOverlayStyleChanged(
            MySystemUiOverlayStyle().stringFromEnum(style)!,
          );
        },
        expect: () {
          return [
            AppBarThemeState(theme: AppBarTheme(systemOverlayStyle: style)),
          ];
        },
      );
    }
  });
}