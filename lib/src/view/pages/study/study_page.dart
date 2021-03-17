import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/controllers/study_page_controller.dart';
import 'package:proffy/src/view/pages/study/styles.dart';
import 'package:proffy/src/view/pages/study/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/app_bar/app_app_bar/app_app_bar.dart';
import 'package:proffy/src/view/widgets/button/button/button.dart';
import 'package:proffy/src/view/widgets/card/lesson_card/lesson_card.dart';
import 'package:proffy/src/view/widgets/dropdown/dropdown/dropdown.dart';
import 'package:proffy/src/view/widgets/text/app_title/app_title.dart';
import 'package:proffy/src/view/widgets/tile/expansion_tile_filters/expansion_tile_filters.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/utils/week_day.dart' as week;

class StudyPage extends StatelessWidget with StudyPageStyle {
  final controller = Injection.find<StudyPageController>();

  @override
  Widget build(BuildContext context) {
    AppTheme.setSystemTheme();

    return Scaffold(
      appBar: AppAppBar(),
      bottomNavigationBar: StudyBottomNavigationBar(),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.changeScreenIndex,
        children: [
          _buildScreen(
            withFilters: true,
            titleItems: [
              _buildTitleLine('Proffys'),
              SizedBox(height: 4),
              _buildTitleLine('Disponíveis'),
            ],
          ),
          _buildScreen(
            titleItems: [
              _buildTitleLine('Meus proffys'),
              SizedBox(height: 4),
              _buildTitleLine('Favoritos'),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildScreen({
    bool withFilters = false,
    List<Widget> titleItems = const [],
  }) {
    return Container(
      transform: Matrix4.translationValues(0.0, -1, 0.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Pallete.primary,
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 1, 25, 15),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: titleItems,
                  ),
                ),
                withFilters
                    ? ExpansiontileFilters(
                        placeholder: 'Filtrar por dia, hora e matéria',
                        children: [
                          _buildFilterDropdown(
                            label: 'Matéria',
                            onChanged: (a) {},
                            items: week.weekDays,
                          ),
                          SizedBox(height: 10),
                          _buildFilterDropdown(
                            label: 'Dia da semana',
                            onChanged: (a) {},
                            items: week.weekDays,
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            child: Button('Filtrar', onTap: () {}),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Stack(
            children: [
              Container(height: 60, color: Pallete.primary),
              Obx(
                () => Column(
                  children: [
                    for (var lesson in controller.lessons) LessonCard(lesson)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppTitle _buildTitleLine(String text) {
    return AppTitle(
      text,
      color: Pallete.textInPrimary2,
      fontSize: 24,
      bold: true,
      archivo: true,
    );
  }

  DropDown _buildFilterDropdown({
    String label = '',
    String placeholder = 'Selecione',
    void Function(Object) onChanged,
    List<String> items,
  }) {
    return DropDown(
      label: label,
      placeholder: placeholder,
      onChanged: onChanged,
      items: [
        for (final item in items)
          DropdownMenuItem(
            child: Text(item, style: dropdownItemStyle()),
            value: item.toLowerCase(),
          )
      ],
    );
  }
}
