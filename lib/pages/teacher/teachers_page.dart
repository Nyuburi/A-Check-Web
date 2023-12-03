import 'package:a_check_web/pages/teacher/teacher_list.dart';
import 'package:a_check_web/utils/abstracts.dart';
import 'package:flutter/material.dart';

import './teachers_page_con.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => TeachersPageState();
}

class TeachersPageView extends WidgetView<TeachersPage, TeachersPageState> {
  const TeachersPageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top:60, bottom: 40),
                child: Text(
                  "Teachers",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "De La Cruz, John",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Ateneo De Naga University",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_drop_down, size: 25),
                      tooltip: 'Profile',
                      onPressed: null,
                    ),
                  ]),
            ],
          ),
        ),
        body: Row(
          children: [
            Flexible(
              flex: 2,
              child: TeacherList(
                onListRowTap: state.onListRowTap,
              ),
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 0.1,
            ),
            Flexible(
              flex: 1,
              child:
                state.teacherInfoWidget ?? Container(
                  alignment: Alignment.center,
                  child:
                    const Text('Select a teacher to show profile.')
              ),
            ),
          ],
        )
    );
  }
}
