import 'package:flutter_test/flutter_test.dart';
import 'package:install_referrer_v2/install_referrer_v2.dart';
import 'package:install_referrer_v2/install_referrer_v2_platform_interface.dart';
import 'package:install_referrer_v2/install_referrer_v2_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInstallReferrerV2Platform
    with MockPlatformInterfaceMixin
    implements InstallReferrerV2Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InstallReferrerV2Platform initialPlatform = InstallReferrerV2Platform.instance;

  test('$MethodChannelInstallReferrerV2 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInstallReferrerV2>());
  });

  test('getPlatformVersion', () async {
    InstallReferrerV2 installReferrerV2Plugin = InstallReferrerV2();
    MockInstallReferrerV2Platform fakePlatform = MockInstallReferrerV2Platform();
    InstallReferrerV2Platform.instance = fakePlatform;

    expect(await installReferrerV2Plugin.getPlatformVersion(), '42');
  });
}
