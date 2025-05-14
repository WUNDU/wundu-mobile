import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';

class ProtectedRoute extends StatelessWidget {
  final Widget child;

  const ProtectedRoute({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SessionService().isSessionValid(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (!snapshot.data!) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            NavigatorService.pushNamedAndRemovedUntil(
              AppRoutes.authScreen,
              routePredicate: false,
            );
          });
          return Container();
        }
        return child;
      },
    );
  }
}
