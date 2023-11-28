import 'package:a_check_web/forms/class_form.dart';
import 'package:a_check_web/globals.dart';
import 'package:a_check_web/model/school_class.dart';
import 'package:a_check_web/utils/dialogs.dart';
import 'package:flutter/material.dart';

class ClassFormState extends State<ClassForm> {
  final formKey = GlobalKey<FormState>();
  List<ClassSchedule> schedules = [];
  late TextEditingController codeCon, nameCon, sectionCon;

  @override
  Widget build(BuildContext context) => ClassFormView(this);

  @override
  void initState() {
    super.initState();
    codeCon = TextEditingController();
    nameCon = TextEditingController();
    sectionCon = TextEditingController();
  }

  void addSchedule() async {
    final result = await Dialogs.showScheduleDialog(context);

    if (result == null) return;
    if (_hasSameSchedule(result)) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Schedule already exists!")));
      return;
    }
    if (_hasConflict(result)) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Schedule conflicts with another!")));
      return;
    }
    setState(() {
      schedules.add(result);
    });
  }

  void editSchedule(int index) async {
    final result =
        await Dialogs.showScheduleDialog(context, schedule: schedules[index]);

    if (result == null) return;
    setState(() {
      schedules[index] = result;
    });
  }

  bool _hasSameSchedule(ClassSchedule schedule) {
    for (ClassSchedule s in schedules) {
      if (schedule.toString() == s.toString()) return true;
    }

    return false;
  }

  bool _hasConflict(ClassSchedule schedule) {
    bool isDateInRange(DateTime date, DateTime startDate, DateTime endDate) =>
        date.isAfter(startDate) && date.isBefore(endDate);

    for (ClassSchedule s in schedules) {
      // check if day is the same
      if (s.weekday == schedule.weekday) {
        // check if the new schedule starttime is in range
        if (isDateInRange(schedule.getStartDateTime(), s.getStartDateTime(),
            s.getEndDateTime())) return true;
        // check if the new schedule endtime is in range
        if (isDateInRange(schedule.getEndDateTime(), s.getStartDateTime(),
            s.getEndDateTime())) return true;
      }
    }

    return false;
  }

  void deleteSchedule(int index) async {
    final result = await Dialogs.showConfirmDialog(
        context, const Text("Delete Schedule"), const Text("Are you sure?"));
    if (result == null || !result) return;

    setState(() {
      schedules.removeAt(index);
    });
  }

  confirmForm() {
    if (!formKey.currentState!.validate()) return;
    if (schedules.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No schedules set!")));
      return;
    }
  }
}
