import 'package:a_check_web/pages/teacher/teacher_list.dart';
import 'package:a_check_web/utils/abstracts.dart';
import 'package:flutter/material.dart';

import './teachers_page_con.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key, this.searchController});

  final SearchController? searchController;

  @override
  State<TeachersPage> createState() => TeachersPageState();
}

class TeachersPageView extends WidgetView<TeachersPage, TeachersPageState> {
  const TeachersPageView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: TeacherList(
            onListRowTap: state.onListRowTap,
            searchController: widget.searchController,
          ),
        ),
        const VerticalDivider(
          color: Colors.black,
          thickness: 0.1,
        ),
        state.teacherProfileWidget != null
            ? Flexible(
                flex: 1,
                child: Stack(children: [
                  state.teacherProfileWidget!,
                  Container(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: state.closeProfile,
                        icon: const Icon(Icons.close)),
                  )
                ]))
            : Container(),
      ],
    );
  }
}
