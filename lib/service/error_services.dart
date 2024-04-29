

import 'package:flutter/widgets.dart' show Icon, VoidCallback;

import '../constants/app_error.dart';
import '../widget/error_toast.dart';
import 'navigation_service.dart';



class ErrrorService {
  final NavigationService navigationService;
  const ErrrorService(this.navigationService);

  void showError(Failure failure, [Icon? icon, VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.context;
    final ErrorToast handler = ErrorToast();
    handler.showError(context, failure.toString() ,icon, onRetry);
  }
  void showSuccess(Failure failure, [Icon? icon, VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.context;
    final ErrorToast handler = ErrorToast();
    handler.showError(context, failure.toString() ,icon, onRetry);
  }
}
