import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              AppColors.black,
              AppColors.secondaryBlack,
              AppColors.secondaryBlack.withOpacity(.99),
              AppColors.secondaryBlack.withOpacity(.98),
              AppColors.secondaryBlack.withOpacity(.97),
              AppColors.secondaryBlack.withOpacity(.96),
              AppColors.secondaryBlack.withOpacity(.95),
              AppColors.secondaryBlack.withOpacity(.94),
              AppColors.secondaryBlack.withOpacity(.93),
              AppColors.secondaryBlack.withOpacity(.92),
              AppColors.secondaryBlack.withOpacity(.91),
              AppColors.secondaryBlack.withOpacity(.90),
              AppColors.darkBlue,
              AppColors.accentBlue,
              AppColors.lightBlue
            ])),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 36,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(children),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
