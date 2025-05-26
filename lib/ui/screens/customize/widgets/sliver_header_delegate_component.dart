import 'package:beercules/common/constants.dart';
import 'package:beercules/ui/screens/customize/customize_view.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverHeaderDelegateComponent extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegateComponent();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var controller = BlocProvider.of<CustomizeCubit>(context);
    return Padding(
      padding: Constants.pagePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BeerculesIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          BeerculesIconButton(
            onPressed: controller.restoreDefault,
            icon: Icons.restore,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  double get _height => kToolbarHeight + Constants.pagePadding.top;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
