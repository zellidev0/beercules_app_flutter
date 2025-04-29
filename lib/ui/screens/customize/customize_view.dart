import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/constants.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/screens/customize/widgets/card_details_view.dart';
import 'package:beercules/ui/screens/customize/widgets/customize_card.dart';
import 'package:beercules/ui/screens/customize/widgets/sliver_header_delegate_component.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizeView extends StatelessWidget {
  const CustomizeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final CustomizeController controller =
        BlocProvider.of<CustomizeController>(context);

    return ScaffoldWidget(
      padding: EdgeInsets.zero,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverHeaderDelegateComponent(controller: controller),
          ),
          SliverPadding(
            padding: Constants.pagePadding.copyWith(top: 0),
            sliver: BlocBuilder<CustomizeController, CustomizeModel>(
              builder:
                  (final BuildContext context, final CustomizeModel model) =>
                      SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5 / 3.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (final _, final int index) => CustomizeCard(
                  cardKey: model.configCards[index].type,
                  onTap: () async => controller.showCard(
                    cardType: model.configCards[index].type,
                    widget: CardDetailsView(
                      card: model.configCards[index],
                      onTap: controller.pop,
                      onButtonTap: controller.modifyCardAmount,
                    ),
                  ),
                ),
                itemCount: model.configCards.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

abstract class CustomizeController extends Cubit<CustomizeModel> {
  CustomizeController(super.initialState);

  void goBackToHome();
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  });
  void modifyCardAmount();
  void restoreDefault();
  void pop();
}
