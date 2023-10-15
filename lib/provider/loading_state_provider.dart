import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingStateProvider = Provider((ref) => LoadingStateProvider());

class LoadingStateProvider {
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() => _isLoadingController.close();

  void setIsLoadingState(bool isLoading) => _isLoadingController.add(isLoading);
}
