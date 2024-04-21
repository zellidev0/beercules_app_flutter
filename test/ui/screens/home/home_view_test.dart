import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/home/home_providers.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/src/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  setUpAll(() {
    EasyLocalization.logger.enableBuildModes = <BuildMode>[];
    EasyLocalization.logger.enableLevels = <LevelMessages>[
      LevelMessages.error,
      LevelMessages.warning,
    ];
  });

  testWidgets('HomeView renders correctly', (final WidgetTester tester) async {
    final MockHomeController homeControllerMock = MockHomeController();
    tester.view.physicalSize = const Size(400, 1000);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: ProviderContainer(
          overrides: <Override>[
            homeControllerProvider.overrideWithValue(homeControllerMock),
          ],
        ),
        child: const MaterialApp(home: HomeView()),
      ),
    );

    expect(find.text(LocaleKeys.home_view_title.tr()), findsOneWidget);
    expect(find.text(LocaleKeys.home_view_sub_title.tr()), findsOneWidget);

    expect(
      find.text(LocaleKeys.home_view_button_go_drinking.tr()),
      findsOneWidget,
    );
    expect(find.text(LocaleKeys.home_view_button_rules.tr()), findsOneWidget);
    expect(
      find.text(LocaleKeys.home_view_button_customize.tr()),
      findsOneWidget,
    );
  });

  testWidgets('Button Go Drinking calls goToGameView',
      (final WidgetTester tester) async {
    final MockHomeController homeControllerMock = MockHomeController();
    tester.view.physicalSize = const Size(400, 1000);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: ProviderContainer(
          overrides: <Override>[
            homeControllerProvider.overrideWithValue(homeControllerMock),
          ],
        ),
        child: const MaterialApp(home: HomeView()),
      ),
    );

    await tester.tap(find.text(LocaleKeys.home_view_button_go_drinking.tr()));
    await tester.pump();

    verify(homeControllerMock.goToGameView()).called(1);

    verifyNoMoreInteractions(homeControllerMock);
  });

  testWidgets('Button Rules calls goToRulesView',
      (final WidgetTester tester) async {
    final MockHomeController homeControllerMock = MockHomeController();
    tester.view.physicalSize = const Size(400, 1000);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: ProviderContainer(
          overrides: <Override>[
            homeControllerProvider.overrideWithValue(homeControllerMock),
          ],
        ),
        child: const MaterialApp(home: HomeView()),
      ),
    );

    await tester.tap(find.text(LocaleKeys.home_view_button_rules.tr()));
    await tester.pump();

    verify(homeControllerMock.goToRulesView()).called(1);
    verifyNoMoreInteractions(homeControllerMock);
  });

  testWidgets('Button Customize calls goToCustomizeView',
      (final WidgetTester tester) async {
    final MockHomeController homeControllerMock = MockHomeController();
    tester.view.physicalSize = const Size(400, 1000);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: ProviderContainer(
          overrides: <Override>[
            homeControllerProvider.overrideWithValue(homeControllerMock),
          ],
        ),
        child: const MaterialApp(home: HomeView()),
      ),
    );

    await tester.tap(find.text(LocaleKeys.home_view_button_customize.tr()));
    await tester.pump();

    verify(homeControllerMock.goToCustomizeView()).called(1);
    verifyNoMoreInteractions(homeControllerMock);
  });
}
