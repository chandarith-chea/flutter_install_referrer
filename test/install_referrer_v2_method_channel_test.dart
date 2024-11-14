import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:install_referrer_v2/install_referrer_v2_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInstallReferrerV2 platform = MethodChannelInstallReferrerV2();
  const MethodChannel channel = MethodChannel('install_referrer_v2');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
