// core/session/activity_tracker.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';

// core/session/activity_tracker.dart
mixin ActivityTracker<T extends StatefulWidget> on State<T> {
  Timer? _sessionTimer;

  @override
  void initState() {
    super.initState();
    _resetTimer();
    _setupActivityListeners();
  }

  void _setupActivityListeners() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        resumeCallBack: () => _resetTimer(),
        detachCallBack: () => _sessionTimer?.cancel(),
      ),
    );
  }

  void _resetTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer(const Duration(minutes: 5), _handleTimeout);
    SessionService().updateLastActivity();
  }

  void _handleTimeout() {
    SessionService().clearSession();
    NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen);
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    super.dispose();
  }
}


class LifecycleEventHandler extends WidgetsBindingObserver {
  final VoidCallback resumeCallBack;
  final VoidCallback detachCallBack;

  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.detachCallBack,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        resumeCallBack();
        break;
      case AppLifecycleState.detached:
        detachCallBack();
        break;
      default:
    }
  }
}
