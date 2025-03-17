// core/session/activity_tracker.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';

mixin ActivityTracker<T extends StatefulWidget> on State<T> {
  Timer? _sessionTimer;

  @override
  void initState() {
    super.initState();
    _startSessionTimer();
    _setupActivityListeners();
  }

  void _setupActivityListeners() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        resumeCallBack: resetSessionTimer,
        detachCallBack: () => _sessionTimer?.cancel(),
      ),
    );
  }

  void _startSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer(const Duration(minutes: 5), _handleTimeout);
    SessionService().updateLastActivity();
  }

  void resetSessionTimer() {
    _startSessionTimer();
    SessionService().updateLastActivity();
  }

  void _handleTimeout() {
    SessionService().clearSession();
    if (mounted) {
      NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen);
    }
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
