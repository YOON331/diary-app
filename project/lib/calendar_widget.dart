import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/diary_page.dart';
import 'package:project/event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEx2 extends StatefulWidget {
  @override
  State<CalendarEx2> createState() => _CalendarEx2State();
}

class _CalendarEx2State extends State<CalendarEx2> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focousedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focousedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2040),
                onDaySelected: _onDaySelected,
                eventLoader: _getEventsForDay,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // margin: const EdgeInsets.symmetric(
                            //     horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              onTap: () => print(" "),
                              title: Text('${value[index]}'),
                            ),
                          );
                        });
                  }),
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [btn()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btn() {
    return FloatingActionButton(
      onPressed: () {
        // move to diarypage
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const DiaryPage();
        }));
        // showDialog - can write title
        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         scrollable: true,
        //         title: const Text("Diary Title"),
        //         content: Padding(
        //           padding: EdgeInsets.all(8),
        //           child: TextField(
        //             controller: _eventController,
        //           ),
        //         ),
        //         actions: [
        //           ElevatedButton(
        //             onPressed: () {
        //                 events.addAll({
        //                   _selectedDay!: [Event(_eventController.text)]
        //                 });
        //                 Navigator.of(context).pop();
        //                 _selectedEvents.value = _getEventsForDay(_selectedDay!);
        //             },
        //             child: const Text("Submit"),
        //           )
        //         ],
        //       );
        // });
      },
      child: const Icon(Icons.add),
    );
  }
}
