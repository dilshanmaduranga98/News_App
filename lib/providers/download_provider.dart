import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_provider.g.dart';

@riverpod
class SaveNews extends _$SaveNews{

  @override 
  bool build() {
    return false;
    }

  void toggle(){
    state = !state;
  }
}