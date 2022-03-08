import 'package:data_module/data_module.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState(
      {@Default(User(name: "Default", age: 0, salary: 0)) User user,
      @Default(true) bool isLoading}) = _UserState;
}
