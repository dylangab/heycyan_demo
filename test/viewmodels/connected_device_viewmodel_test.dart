import 'package:flutter_test/flutter_test.dart';
import 'package:heycyan_demo/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ConnectedDeviceViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
