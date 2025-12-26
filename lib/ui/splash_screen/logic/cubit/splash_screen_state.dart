import 'package:meta/meta.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashShowStart extends SplashScreenState {}

class SplashHasToken extends SplashScreenState {}

class SplashNoToken extends SplashScreenState {}
