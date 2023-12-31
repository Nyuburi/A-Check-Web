import 'package:a_check_web/model/school.dart';
import 'package:a_check_web/pages/class/class_list_con.dart';
import 'package:a_check_web/utils/abstracts.dart';
import 'package:a_check_web/widgets/table_actions_row.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ClassList extends StatefulWidget {
  const ClassList(
      {super.key, required this.onListRowTap, this.searchController});

  final SearchController? searchController;
  final Function(SchoolClass schoolClass) onListRowTap;

  @override
  State<ClassList> createState() => ClassListState();
}

class ClassListView extends WidgetView<ClassList, ClassListState> {
  const ClassListView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: classesRef,
      builder: (context, snapshot, child) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(color: Color(0xff153faa),));
        }

        List<DataColumn2> columns = [
          DataColumn2(
              label: const Text("Code"),
              onSort: (columnIndex, ascending) =>
                  state.sort((s) => s.subjectCode, columnIndex, ascending),
              size: ColumnSize.S),
          DataColumn2(
              label: const Text("Name"),
              onSort: (columnIndex, ascending) =>
                  state.sort((s) => s.name, columnIndex, ascending),
              size: ColumnSize.M),
          DataColumn2(
              label: const Text("Section"),
              onSort: (columnIndex, ascending) =>
                  state.sort((s) => s.section, columnIndex, ascending),
              size: ColumnSize.S),
          DataColumn2(
              label: const Text("Teacher"),
              onSort: (columnIndex, ascending) =>
                  state.sort((s) => s.teacherId, columnIndex, ascending),
              size: ColumnSize.L),
          DataColumn2(
              label: const Text("Schedule"),
              onSort: (columnIndex, ascending) =>
                  state.sort((s) => s.getSchedule(), columnIndex, ascending),
              size: ColumnSize.M),
          const DataColumn2(label: Text("Actions"), size: ColumnSize.S)
        ];

        return PaginatedDataTable2(
          columns: columns,
          source: state.rows,
          header: buildHeader(),
          actions: [
            TableActionsRow(
              onAddButtonPressed: state.openForm,
              onDeleteAllButtonPressed: state.deleteSelected,
              addTooltip: "Add new class",
              deleteAllTooltip: "Delete selected rows",
            ),
          ],
          rowsPerPage: 15,
          sortColumnIndex: state.sortColumnIndex,
          sortAscending: state.sortAscending,
          renderEmptyRowsInTheEnd: false,
          empty: const Center(
            child: Text("No entries found!"),
          ),
          headingCheckboxTheme: Theme.of(context).checkboxTheme,
          headingTextStyle: const TextStyle(color: Colors.black),
          headingRowColor: MaterialStateColor.resolveWith((states) {return const Color(0xffFAF9FE);},),
          datarowCheckboxTheme: Theme.of(context).checkboxTheme,
          checkboxAlignment: Alignment.center,
          onSelectAll: state.rows.selectAll,
          sortArrowIcon: Icons.keyboard_arrow_up_sharp,
        );
      },
    );
  }

  Container buildHeader() {
    return Container(
        height: 48,
        padding: const EdgeInsets.all(8.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("List of Classes",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ],
        ));
  }
}
