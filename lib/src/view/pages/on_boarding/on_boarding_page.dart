import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/controllers/on_boarding_page_controller.dart';
import 'package:proffy/src/view/pages/on_boarding/styles.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/text/app_title/app_title.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class OnBoardingPage extends StatelessWidget with OnBoardingPageStyles {
  final controller = Injection.find<OnBoardingPageController>();

  @override
  Widget build(BuildContext context) {
    _setSystemTheme();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: controller.changeScreenIndex,
              itemCount: controller.screenData.length,
              itemBuilder: (_, index) => _buildOnBoardingScreen(
                context: context,
                data: controller.screenData[index],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Obx(
              () => Row(
                children: [
                  _buildScreenIndicator(Pallete.primary, 0),
                  SizedBox(width: 5),
                  _buildScreenIndicator(Pallete.secondary, 1),
                  Spacer(),
                  InkWell(
                    child: image.assetImg(image.rightArrow),
                    onTap: () => controller.handleNextPage(
                      Duration(milliseconds: 300),
                      Curves.linear,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnBoardingScreen({BuildContext context, Map data}) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Column(
            children: _buildOnBoardingScreenWidgets(
            context: context,
            data: data,
          ))
        : Row(
            children: _buildOnBoardingScreenWidgets(
            context: context,
            data: data,
            portrait: false,
          ));
  }

  List<Widget> _buildOnBoardingScreenWidgets({
    BuildContext context,
    Map data,
    bool portrait = true,
  }) {
    final screen = MediaQuery.of(context);

    return [
      Container(
        color: data['color'],
        height: portrait ? screen.size.height * .45 : double.infinity,
        width: portrait ? double.infinity : screen.size.width * .45,
        padding: EdgeInsets.fromLTRB(40, screen.padding.top + 40, 40, 40),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            image.assetImg(
              image.backgroundBubbles,
              color: Colors.white.withOpacity(.5),
            ),
            image.assetImg(data['image'])
          ],
        ),
      ),
      Expanded(
        child: Container(
          width: double.infinity,
          alignment: portrait ? Alignment.centerLeft : Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('0${data['number']}.', style: numberStyle(context)),
                SizedBox(height: 24),
                AppTitle(data['message1'], fontSize: 24),
                AppTitle(data['message2'], fontSize: 24),
                AppTitle(data['message3'], fontSize: 24),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildScreenIndicator(Color color, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 4,
      width: 4,
      decoration: screenIndicator(color, controller.isCurrentScreen(index)),
    );
  }

  void _setSystemTheme() => AppTheme.setSystemTheme();
}
