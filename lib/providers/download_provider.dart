import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_provider.g.dart';

@riverpod
class SaveNews extends _$SaveNews{

  @override 
  bool build() => false;

  void toggle(){
    state = !state;
  }
}