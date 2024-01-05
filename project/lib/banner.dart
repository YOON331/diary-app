// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project/event.dart';
// import 'package:table_calendar/table_calendar.dart';

// class BannerWidget extends StatelessWidget {
//   final OnDaySelected onDaySelected;
//   final DateTime selectedDate;

//   const BannerWidget({
//     super.key,
//     required this.onDaySelected,
//     required this.selectedDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var fromDate = DateFormat('yyyy-MM-dd').format(selectedDate);
//     List<Event> eventList = [
//       Event(dateTime: DateTime.parse('20240105'), event: "코딩하기1"),
//       Event(dateTime: DateTime.parse('20240105'), event: "코딩하기2"),
//     ];
//     return ListView.builder(
//         // scrollDirection: Axis.vertical,
//         itemCount: eventList.length,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 // Text(fromDate.toString()),
//                 Text(eventList[index].event.toString())
//               ],
//             ),
//           );
//         });
//   }
// }
