import 'package:flutter/material.dart';

import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/app_icon_button/app_icon_button.dart';
import 'package:proffy/src/view/widgets/button/icon_text_button/icon_text_button.dart';
import 'package:proffy/src/view/widgets/card/lesson_card/styles.dart';
import 'package:proffy/src/view/widgets/image/profile_image/profile_image.dart';
import 'package:proffy/src/view/widgets/text/app_title/app_title.dart';
import 'package:proffy/src/view/widgets/text/primary_suffix/primary_suffix.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class LessonCard extends StatelessWidget with LessonCardStyles {
  final imagePath = 'https://thispersondoesnotexist.com/image';
  final Lesson lesson;

  LessonCard(this.lesson, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: containerDecoration(),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ProfileImage(lesson.teacher.profilePhoto ?? imagePath),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTitle(
                              lesson.teacher.name,
                              color: Pallete.title,
                              bold: true,
                              archivo: true,
                            ),
                            Text(
                              lesson.subject.title,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(lesson.teacher.bio ?? ''),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: footerContainerDecoration(),
              child: Column(
                children: [
                  PrimarySuffix('Preço/hora ', right: 'R\$ ${lesson.price}'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIconButton(image.heartOutlined),
                      SizedBox(width: 10),
                      IconTextButton(
                        'Entrar em contato',
                        icon: image.whatsapp,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
