import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/ui/screens/customize/customize_controller.dart';
import 'package:beercules/ui/screens/customize/customize_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<CustomizeController>(
        create: (final BuildContext context) =>
            CustomizeControllerImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
          persistenceService: context.read<PersistenceServiceAggregator>(),
        ),
        child: const CustomizeView(),
      );
}
