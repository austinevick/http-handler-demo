import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_handler_demo/common/api_handler.dart';
import 'package:http_handler_demo/common/utils.dart';
import 'package:http_handler_demo/model/login.dart';
import 'package:http_handler_demo/repository/auth_repository.dart';

import 'loading_state_provider.dart';

final authProvider = Provider((ref) => AuthProvider(ref));

class AuthProvider {
  final Ref ref;

  AuthProvider(this.ref);

  Future<ResponseModel> login(LoginModel model) async {
    //Dialog state
    final response =
        await runcallWithDialog<ResponseModel>(AuthRepository.login(model));
    if (response.status == 200) {
      customSnackBar(response.data!.email);
    } else if (response.status == 400) {
      customSnackBar(response.message);
    }
    pop();
    return response;

    //Loading state
    // final response = await runcallWithLoader<ResponseModel>(
    //     AuthRepository.login(model), ref);
    // if (response.status == 200) {
    //   customSnackBar(response.data!.email);
    // } else if (response.status == 400) {
    //   customSnackBar(response.message);
    // }
    // ref.watch(loadingStateProvider).setIsLoadingState(false);
    // return response;
  }
}
