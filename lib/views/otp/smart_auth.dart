part of 'view.dart';

const _defaultCodeMatcher = '\\d{4,8}';

class Methods {
  static const getAppSignature = 'getAppSignature';
  static const startSmsRetriever = 'startSmsRetriever';
  static const stopSmsRetriever = 'stopSmsRetriever';
  static const startSmsUserConsent = 'startSmsUserConsent';
  static const stopSmsUserConsent = 'stopSmsUserConsent';
  static const requestHint = 'requestHint';
  static const getCredential = 'getCredential';
  static const saveCredential = 'saveCredential';
  static const deleteCredential = 'deleteCredential';
}

class SmartAuth {
  static const MethodChannel _channel = MethodChannel('fman.smart_auth');

  Future<String?> getAppSignature() async {
    if (_isAndroid(Methods.getAppSignature)) {
      return _channel.invokeMethod(Methods.getAppSignature);
    }
    return null;
  }

  Future<SmsCodeResult> getSmsCode({
    String matcher = _defaultCodeMatcher,
    String? senderPhoneNumber,
    bool useUserConsentApi = false,
  }) async {
    if (senderPhoneNumber != null) {
      assert(
        useUserConsentApi == true,
        'senderPhoneNumber is only supported if useUserConsentApi is true',
      );
    }
    try {
      if (_isAndroid('getSmsCode')) {
        final String? sms = useUserConsentApi
            ? await _channel.invokeMethod(Methods.startSmsUserConsent, {
                'senderPhoneNumber': senderPhoneNumber,
              })
            : await _channel.invokeMethod(Methods.startSmsRetriever);
        return SmsCodeResult.fromSms(sms, matcher);
      }
    } catch (error) {
      debugPrint('Pinput/SmartAuth: getSmsCode failed: $error');
      return SmsCodeResult.fromSms(null, matcher);
    }

    return SmsCodeResult.fromSms(null, matcher);
  }

  Future<void> removeSmsListener() async {
    if (_isAndroid('removeSmsListener')) {
      try {
        Future.wait([
          removeSmsRetrieverListener(),
          removeSmsUserConsentListener(),
        ]);
      } catch (error) {
        debugPrint('Pinput/SmartAuth: removeSmsListener failed: $error');
      }
    }
  }

  Future<bool> removeSmsRetrieverListener() async {
    try {
      if (_isAndroid('removeSmsRetrieverListener')) {
        final res = await _channel.invokeMethod(Methods.stopSmsRetriever);
        return res == true;
      }
    } catch (error) {
      debugPrint('Pinput/SmartAuth: removeSmsRetrieverListener failed: $error');
    }
    return false;
  }

  Future<bool> removeSmsUserConsentListener() async {
    try {
      if (_isAndroid('removeSmsUserConsentListener')) {
        final res = await _channel.invokeMethod(Methods.stopSmsUserConsent);
        return res == true;
      }
    } catch (error) {
      debugPrint(
        'Pinput/SmartAuth: removeSmsUserConsentListener failed: $error',
      );
    }
    return false;
  }

  Future<Credential?> requestHint({
    bool? isEmailAddressIdentifierSupported,
    bool? isPhoneNumberIdentifierSupported,
    String? accountTypes,
    bool? showAddAccountButton,
    bool? showCancelButton,
    bool? isIdTokenRequested,
    String? idTokenNonce,
    String? serverClientId,
  }) async {
    if (_isAndroid(Methods.requestHint)) {
      try {
        final res = await _channel.invokeMethod(Methods.requestHint, {
          'isEmailAddressIdentifierSupported':
              isEmailAddressIdentifierSupported,
          'isPhoneNumberIdentifierSupported': isPhoneNumberIdentifierSupported,
          'accountTypes': accountTypes,
          'isIdTokenRequested': isIdTokenRequested,
          'showAddAccountButton': showAddAccountButton,
          'showCancelButton': showCancelButton,
          'idTokenNonce': idTokenNonce,
          'serverClientId': serverClientId,
        });
        if (res == null) return null;
        final Map<String, dynamic> map =
            jsonDecode(jsonEncode(res)) as Map<String, dynamic>;
        return Credential.fromJson(map);
      } catch (error) {
        debugPrint('Pinput/SmartAuth: requestHint failed: $error');
        return null;
      }
    }
    return null;
  }

  Future<Credential?> getCredential({
    String? accountType,
    String? serverClientId,
    String? idTokenNonce,
    bool? isIdTokenRequested,
    bool? isPasswordLoginSupported,
    bool showResolveDialog = false,
  }) async {
    if (_isAndroid(Methods.getCredential)) {
      try {
        final res = await _channel.invokeMethod(Methods.getCredential, {
          'accountType': accountType,
          'serverClientId': serverClientId,
          'idTokenNonce': idTokenNonce,
          'isIdTokenRequested': isIdTokenRequested,
          'isPasswordLoginSupported': isPasswordLoginSupported,
          'showResolveDialog': showResolveDialog,
        });

        if (res == null) return null;

        final Map<String, dynamic> map =
            jsonDecode(jsonEncode(res)) as Map<String, dynamic>;
        return Credential.fromJson(map);
      } catch (error) {
        debugPrint('Pinput/SmartAuth: getCredential failed: $error');
        return null;
      }
    }
    return null;
  }

  Future<bool> saveCredential({
    required String id,
    String? accountType,
    String? name,
    String? password,
    String? profilePictureUri,
  }) async {
    if (_isAndroid(Methods.saveCredential)) {
      try {
        final res = await _channel.invokeMethod(Methods.saveCredential, {
          'id': id,
          'accountType': accountType,
          'name': name,
          'password': password,
          'profilePictureUri': profilePictureUri,
        });
        return res == true;
      } catch (error) {
        debugPrint('Pinput/SmartAuth: saveCredential failed: $error');
        return false;
      }
    }
    return false;
  }

  Future<bool> deleteCredential({
    required String id,
    String? accountType,
    String? name,
    String? password,
    String? profilePictureUri,
  }) async {
    if (_isAndroid(Methods.deleteCredential)) {
      try {
        final res = await _channel.invokeMethod(Methods.deleteCredential, {
          'id': id,
          'accountType': accountType,
          'name': name,
          'password': password,
          'profilePictureUri': profilePictureUri,
        });
        return res == true;
      } catch (error) {
        debugPrint('Pinput/SmartAuth: deleteCredential failed: $error');
        return false;
      }
    }
    return false;
  }

  bool _isAndroid(String method) {
    if (defaultTargetPlatform == TargetPlatform.android) return true;
    debugPrint('SmartAuth $method is not supported on $defaultTargetPlatform');
    return false;
  }
}
