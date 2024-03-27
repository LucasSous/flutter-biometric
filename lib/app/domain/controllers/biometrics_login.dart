import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricsLogin {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Desbloqueie seu celular',
        authMessages: _authMessages(),
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return authenticated;
  }

  Future<bool> canAuthenticate() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    return canAuthenticate;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }

    return availableBiometrics;
  }

  Iterable<AuthMessages> _authMessages() {
    return const <AuthMessages>[
      AndroidAuthMessages(
        signInTitle: 'InMaster',
        cancelButton: 'Cancelar',
        biometricHint: '',
      ),
      IOSAuthMessages(
        cancelButton: 'Cancelar',
        localizedFallbackTitle: 'Título de recurso localizado',
        lockOut: 'teste',
      ),
    ];
  }
}
