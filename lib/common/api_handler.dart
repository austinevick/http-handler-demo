import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_handler_demo/common/api.dart';
import 'package:http_handler_demo/common/utils.dart';

import '../provider/loading_state_provider.dart';

Future<T> runcallWithDialog<T>(Future<dynamic> data) async {
  try {
    loadingDialog();
    return await data;
  } on TimeoutException {
    customSnackBar(timeout);
    pop();
    rethrow;
  } on SocketException catch (_) {
    customSnackBar(noConnection);
    pop();
    rethrow;
  } on HandshakeException catch (_) {
    customSnackBar(somethingWentWrong);
    pop();
    rethrow;
  } catch (e) {
    customSnackBar(somethingWentWrong);
    pop();
    rethrow;
  }
}

Future<T> runcallWithLoader<T>(Future<dynamic> data, Ref ref) async {
  final provider = ref.watch(loadingStateProvider);
  try {
    provider.setIsLoadingState(true);
    return await data;
  } on TimeoutException {
    customSnackBar(timeout);
    provider.setIsLoadingState(false);
    rethrow;
  } on SocketException catch (_) {
    customSnackBar(noConnection);
    provider.setIsLoadingState(false);
    rethrow;
  } on HandshakeException catch (_) {
    customSnackBar(somethingWentWrong);
    provider.setIsLoadingState(false);
    rethrow;
  } catch (e) {
    provider.setIsLoadingState(false);
    customSnackBar(somethingWentWrong);
    rethrow;
  }
}
