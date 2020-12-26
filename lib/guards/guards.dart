import 'dart:async';

import 'package:flutter/material.dart';
// pkg
import 'package:flutter_boilerplate/constants/constants.dart';

typedef void AuthGuardUnauthenticatedHandler(BuildContext context);

class AuthGuard extends StatefulWidget {
  final Widget child;
  final Widget loadingScreen;
  final Widget unauthenticatedHandler;
  final Stream<AuthGuardStatus> authenticationStream;

  AuthGuard({
    @required this.child,
    @required this.loadingScreen,
    @required this.unauthenticatedHandler,
    @required this.authenticationStream,
  }) {
    assert(this.child != null);
    assert(this.loadingScreen != null);
    assert(this.unauthenticatedHandler != null);
    assert(this.authenticationStream != null);
  }

  @override
  _AuthGuardState createState() {
    return new _AuthGuardState();
  }
}

class _AuthGuardState extends State<AuthGuard> {
  Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = widget.loadingScreen;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthGuardStatus>(
      stream: widget.authenticationStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          currentWidget = widget.loadingScreen;
          return currentWidget;
        } else if (snapshot.data == AuthGuardStatus.NotAuthenticated) {
          currentWidget = widget.unauthenticatedHandler;
        } else if (snapshot.data == AuthGuardStatus.Authenticated) {
          currentWidget = widget.child;
        }
        return currentWidget;
      },
    );
  }
}
