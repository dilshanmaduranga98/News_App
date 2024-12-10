
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme{
  @override 
  bool build() => false;

  void toggle(){
    state = !state;
  }
}