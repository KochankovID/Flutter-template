import 'package:data_module/data_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../state/user_state.dart';

@injectable
class UserBloc extends Cubit<UserState> {
  final UserService _userService;

  UserBloc(UserService userService)
      : _userService = userService,
        super(UserState());

  void loadUsers() async {
    User user = await _userService.getUserInfo();
    emit(state.copyWith(user: user, isLoading: false));
  }

  void updateUser(User user) {
    emit(state.copyWith(user: user));
  }
}
