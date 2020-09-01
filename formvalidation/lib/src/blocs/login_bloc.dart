import 'dart:async';

import 'package:formvalidation/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  //haremos la prueba sin un <String> justo después de "StreamController"
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //recuperar datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //insertar valores al stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//obtener el último valor ingresado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(dynamic) {
    _emailController?.close();
    _passwordController?.close();
  }
}
