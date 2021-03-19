import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/subject.dart';

import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/view/controllers/profile_page_controller.dart';
import 'package:proffy/src/view/pages/profile/styles.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/app_bar/app_app_bar/app_app_bar.dart';
import 'package:proffy/src/view/widgets/button/button/button.dart';
import 'package:proffy/src/view/widgets/dropdown/dropdown/dropdown.dart';
import 'package:proffy/src/view/widgets/input/input.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/utils/image_resolver.dart' as image;
import 'package:proffy/utils/week_day.dart' as week;

class ProfilePage extends StatelessWidget with ProfilePageStyles {
  final controller = Injection.find<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    AppTheme.setSystemTheme();

    return Scaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 50, 15, 50),
              child: Form(
                  child: Obx(
                () => Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: image.networkImg(
                        controller.user.value.profilePhoto,
                      ),
                    ),
                    SizedBox(height: 30),
                    Input(
                      label: 'Link da foto de perfil',
                      light: true,
                      initialValue: controller.user.value.profilePhoto,
                      onChanged: (v) => controller.user.value.profilePhoto = v,
                    ),
                    SizedBox(height: 15),
                    Input(
                      label: 'Nome',
                      light: true,
                      initialValue: controller.user.value.name,
                      onChanged: (v) => controller.user.value.name = v,
                    ),
                    SizedBox(height: 15),
                    Input(
                      label: 'Email',
                      light: true,
                      initialValue: controller.user.value.email,
                      onChanged: (v) => controller.user.value.email = v,
                    ),
                    SizedBox(height: 15),
                    _loadFieldByUserType(context),
                    SizedBox(height: 50),
                    Divider(),
                    Button(
                      'Salvar alterações',
                      loading: controller.loading.value,
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadFieldByUserType(BuildContext context) {
    switch (controller.user.value.type) {
      case UserType.Teacher:
        return _buildTeacherFields(context);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildTeacherFields(BuildContext context) {
    return Column(
      children: [
        Input(
          label: 'Bio',
          light: true,
          initialValue: controller.user.value.bio,
          onChanged: (v) => controller.user.value.bio = v,
        ),
        SizedBox(height: 15),
        Divider(),
        TextButton(
          child: Text('Ver Aulas cadastradas'),
          onPressed: () => _showListOfLessonsForTeacher(context),
        ),
        Divider(),
      ],
    );
  }

  _showListOfLessonsForTeacher(BuildContext context) {
    controller.loadLessons();
    showModalBottomSheet(
      backgroundColor: Pallete.background,
      context: context,
      builder: (_) => Obx(
        () => Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [Text('Aulas Cadastradas'), Spacer(), CloseButton()],
              ),
            ),
            ListTile(
              leading: Icon(Icons.add, color: Pallete.text),
              title: Text('Nova Aula', style: modalTitleStyle()),
              onTap: () => _showcreateoOrUpdateLessonForTeacher(context),
            ),
            for (var lesson in controller.lessons)
              ListTile(
                title: Row(
                  children: [
                    Text(lesson.subject.title, style: lessonStyle()),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.delete, color: Pallete.error),
                      onPressed: () {},
                    )
                  ],
                ),
                onTap: () => _showcreateoOrUpdateLessonForTeacher(
                  context,
                  lesson,
                ),
              ),
          ],
        ),
      ),
    );
  }

  _showcreateoOrUpdateLessonForTeacher(BuildContext context, [Lesson lesson]) {
    AppTheme.setSystemTheme(
      navBarColor: Pallete.primary,
      navBarMode: Brightness.light,
    );

    final creationMode = lesson == null;
    if (creationMode) {
      lesson = Lesson(
        teacher: controller.user.value,
        subject: controller.subjects.first,
        weekDay: week.weekDays.first,
        price: 10,
      );
    }

    showModalBottomSheet(
      backgroundColor: Pallete.primary,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  creationMode ? 'Criar nova aula' : 'Editar aula',
                  style: modalTitleStyle(true),
                ),
                Spacer(),
                CloseButton(
                  onPressed: () {
                    AppTheme.setSystemTheme();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            SizedBox(height: 15),
            Obx(
              () => Column(
                children: [
                  _buildFilterDropdown(
                    label: 'Matéria',
                    items: controller.subjects.map((e) => e.title).toList(),
                    value: lesson.subject.title,
                    onChanged: (v) => lesson.subject.title = v,
                  ),
                  SizedBox(height: 10),
                  _buildFilterDropdown(
                    label: 'Dia da semana',
                    value: lesson.weekDay,
                    onChanged: (v) => lesson.weekDay = v,
                    items: week.weekDays,
                  ),
                  SizedBox(height: 10),
                  Input(
                    label: 'Preço R\$',
                    keyboardType: TextInputType.number,
                    initialValue: lesson.price.toString(),
                    onChanged: (v) =>
                        lesson.price = v.isEmpty ? 0 : double.parse(v),
                  ),
                ],
              ),
            ),
            Divider(height: 25),
            Button(
              creationMode ? 'Criar Aula' : 'Salvar Alterações',
              loading: controller.loading.value,
              onTap: () async {
                await controller.createOrUpdateLesson(lesson);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown({
    String label = '',
    String value,
    void Function(String) onChanged,
    List<String> items,
  }) {
    return DropDown(
      label: label,
      value: value,
      onChanged: onChanged,
      items: [
        for (final item in items)
          DropdownMenuItem(
            child: Text(item, style: dropdownItemStyle()),
            value: item,
          )
      ],
    );
  }
}
