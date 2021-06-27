import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/converters.dart';
import 'package:meta/meta.dart';

@immutable
class SettingState extends Equatable {
  final int themeCode;
  final TemperatureUnit tempUnit;

  SettingState({required this.tempUnit, required this.themeCode});

  factory SettingState.intial() =>
      SettingState(themeCode: 0, tempUnit: TemperatureUnit.celsius);

  SettingState copyWith({int? newThemeCode, TemperatureUnit? newTempUnit}) {
    return SettingState(
      themeCode: newThemeCode ?? this.themeCode,
      tempUnit: newTempUnit ?? this.tempUnit,
    );
  }

  @override
  List<Object?> get props => [themeCode, tempUnit];
}
