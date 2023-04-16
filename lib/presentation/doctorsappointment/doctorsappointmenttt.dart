import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hiw/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';

class Doctorsappointmenttt extends StatefulWidget {
  var name;
  Doctorsappointmenttt({required dname}) {
    name = dname;
  }

  @override
  State<Doctorsappointmenttt> createState() => _DoctorsappointmentState();
}

class _DoctorsappointmentState extends State<Doctorsappointmenttt> {
  final _timePickerTheme = TimePickerThemeData(
    backgroundColor: ColorConstant.cal,
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: ColorConstant.cal, width: 4),
    ),
    dayPeriodBorderSide: BorderSide(color: ColorConstant.cal, width: 4),
    dayPeriodColor: Color.fromARGB(255, 255, 255, 255),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: ColorConstant.cal, width: 4),
    ),
    dayPeriodTextColor: Color.fromARGB(255, 255, 255, 255),
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.orange
            : Color.fromARGB(255, 255, 255, 255)),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Color.fromARGB(255, 0, 0, 0)
            : Colors.orange),
    dialHandColor: Color.fromARGB(255, 0, 0, 0),
    dialBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    hourMinuteTextStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255)),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.orange
            : Color.fromARGB(255, 0, 0, 0)),
    entryModeIconColor: ColorConstant.cal,
  );

  DateTime today = new DateTime.now();
  var date;
  void ondayselect(
    DateTime day,
    DateTime focusedDate,
  ) {
    setState(() {
      today = day;
    });
  }

  TimeOfDay time = TimeOfDay.now();

  void showtimepicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // This uses the _timePickerTheme defined above
            timePickerTheme: _timePickerTheme,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstant.cal),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.deepOrange),
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  var email;
  void initState() {
    super.initState();
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        email = currentUser.email;
      }
    } catch (e) {}
  }

  var db = FirebaseFirestore.instance;
  Future bookAppointment() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    snapshot.docs.forEach((f) {
      if (f['Email'] == email) {
        var user = db.collection("users");
        final data1 = <String, dynamic>{
          "doctor": widget.name,
          "date": today.toString().split(" ")[0],
          "time": time.format(context),
        };
        var appointment = user.doc(f.id).collection("appointments");

        appointment
            .doc(widget.name)
            .set(data1)
            .then((value) => onTapImgCalendar());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.cal,
        title: Text(
          "Book Appointment",
          style: AppStyle.searchAnything,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorConstant.cal,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: getPadding(left: 10, right: 10, top: 0, bottom: 20),
                child: Container(
                  child: TableCalendar(
                      calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                              color: ColorConstant.orange,
                              shape: BoxShape.circle),
                          defaultTextStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          weekendTextStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          cellPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          holidayTextStyle: TextStyle(color: Colors.white),
                          outsideDecoration:
                              BoxDecoration(color: ColorConstant.cal),
                          weekNumberTextStyle: TextStyle(color: Colors.white),
                          rowDecoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: ColorConstant.cal),
                            color: ColorConstant.cal,
                          ),
                          // rangeHighlightColor: ColorConstant.cal,
                          markerDecoration:
                              BoxDecoration(color: ColorConstant.cal),
                          todayDecoration: BoxDecoration(
                              color: ColorConstant.orange,
                              shape: BoxShape.circle)),
                      // startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekHeight: 50,
                      rowHeight: 53,
                      headerStyle: HeaderStyle(
                          decoration: BoxDecoration(color: ColorConstant.cal),
                          rightChevronVisible: false,
                          leftChevronVisible: false,
                          formatButtonShowsNext: false,
                          formatButtonVisible: false,
                          titleCentered: false,
                          headerPadding: EdgeInsets.fromLTRB(10, 25, 20, 20),
                          titleTextStyle: AppStyle.month),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          decoration: BoxDecoration(
                              color: ColorConstant.cal,
                              border: Border.all(
                                  width: 1, color: ColorConstant.cal)),
                          weekdayStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          weekendStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      availableGestures: AvailableGestures.all,
                      onDaySelected: ondayselect,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      focusedDay: today,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 1, 1)),
                ),
              ),
              Text(today.toString().split(" ")[0]),
              Padding(
                padding: getPadding(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              showtimepicker();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: ColorConstant.cal,
                                    borderRadius: BorderRadius.circular(50)),
                                width: 300,
                                height: 80,
                                child: Text(
                                  "${time.format(context)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )),
                          )),
                      Padding(
                        padding: getPadding(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            bookAppointment();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorConstant.orange,
                                  borderRadius: BorderRadius.circular(50)),
                              width: 300,
                              height: 80,
                              child: Text(
                                "BOOK",
                                style: TextStyle(
                                    height: 1,
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }
}
