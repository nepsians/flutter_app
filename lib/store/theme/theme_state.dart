import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ThemeState extends Equatable {
  final int themeCode;

  ThemeState({required this.themeCode});

  factory ThemeState.intial() => ThemeState(themeCode: 0);

  ThemeState copyWith({int? newThemeCode}) {
    return ThemeState(themeCode: newThemeCode ?? this.themeCode);
  }

  @override
  List<Object?> get props => [themeCode];
}
