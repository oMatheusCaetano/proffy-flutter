import 'package:flutter/material.dart';
import 'package:proffy/src/domain/entities/enums.dart';

import 'package:proffy/src/view/controllers/home_page_controller.dart';
import 'package:proffy/src/view/pages/home/styles.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/tall_button/tall_button.dart';
import 'package:proffy/src/view/widgets/text/app_title/app_title.dart';
import 'package:proffy/src/view/widgets/text/text_end_icon/text_end_icon.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class HomePage extends StatelessWidget with HomePageStyles {
  final controller = Injection.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    setDeviceTheme();
    bool portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Pallete.primary,
      body: Container(
        padding: containerPadding(context, portrait),
        child: Column(
          children: portrait
              ? _buildPortraitLayout(context, portrait)
              : _buildLandscapeLayout(context, portrait),
        ),
      ),
    );
  }

  List<Widget> _buildPortraitLayout(BuildContext context, bool portrait) {
    return [
      Expanded(child: image.assetImg(image.hero)),
      Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMessage(),
            SizedBox(height: 40),
            _buildButtons(context),
            SizedBox(height: 40),
            _buildTotalText(portrait),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildLandscapeLayout(BuildContext context, bool portrait) {
    return [
      Row(
        children: [
          _buildMessage(),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * .25,
            child: image.assetImg(image.hero),
          ),
        ],
      ),
      Expanded(child: _buildButtons(context)),
      _buildTotalText(portrait)
    ];
  }

  Widget _buildMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle('Seja bem-vindo.', color: Colors.white),
        AppTitle('O que deseja fazer?', color: Colors.white, bold: true),
      ],
    );
  }

  Container _buildButtons(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TallButton(
            'Estudar',
            width: (MediaQuery.of(context).size.width * .5) - 48,
            top: image.assetImg(image.study, height: 45),
            onTap: () => controller.goToLoginPage(UserType.Student),
          ),
          Spacer(),
          TallButton(
            'Dar aulas',
            width: (MediaQuery.of(context).size.width * .5) - 48,
            top: image.assetImg(image.giveClasses, height: 45),
            color: Pallete.secondary,
            onTap: () => controller.goToLoginPage(UserType.Teacher),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalText(bool portrait) {
    return TextEndIcon(
      portrait ? 'já realizadas' : 'Total de conexões já realizadas',
      top: portrait ? 'Total de conexões' : null,
      iconPath: image.heart,
    );
  }
}
