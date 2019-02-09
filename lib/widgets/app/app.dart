import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pressy_client/blocs/auth/auth_bloc.dart';
import 'package:pressy_client/blocs/auth/auth_event.dart';
import 'package:pressy_client/data/session/auth/auth_session_impl.dart';
import 'package:pressy_client/widgets/auth/auth_widget.dart';
import 'package:pressy_client/utils/style/app_theme.dart';

class Application extends StatelessWidget with AppThemeMixin {

  final AuthBloc authBloc = new AuthBloc(
    authSession: new AuthSessionImpl()
  );

  Application() {
    this.authBloc.dispatch(new AuthAppStartedEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pressy',
      theme: this.appThemeData,
      debugShowCheckedModeBanner: false,
      home: new BlocProvider<AuthBloc>(
        bloc: new AuthBloc(authSession: new AuthSessionImpl()),
        child: new AuthWidget(
          authBloc: this.authBloc
        ),
      ),
    );
  }

}