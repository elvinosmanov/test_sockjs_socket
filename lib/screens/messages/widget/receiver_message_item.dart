// import 'package:flutter/material.dart';

// import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
// import 'package:test_sockjs_socket/core/colors.dart';
// import 'package:test_sockjs_socket/core/styles.dart';
// import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

// class Receiver extends StatelessWidget {
//   const Receiver({
//     Key? key,
//     this.isMultiMessageSent = false,
//     required this.name,
//     required this.body,
//     required this.dateTime,
//     this.padding, required this.isOnline,
//   }) : super(key: key);
//   final bool isMultiMessageSent;
//   final String name;
//   final String body;
//   final String dateTime;
//   final bool isOnline;
//   final EdgeInsets? padding;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding ?? EdgeInsets.only(top: isMultiMessageSent ? 0 : 24),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               if (!isMultiMessageSent)
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                      ProfilePicture(
//                       bigSize: 24,
//                       smallSize: 8,
//                       smallCircleColor: isOnline?kGreenColor:kGreyColor,
//                     ),
//                     const SizedBox(width: 6),
//                     Text(name, style: kMediumTextStyle(12, kGreyColor))
//                   ],
//                 ),
//               const SizedBox(height: 2),
//               Container(
//                 margin: const EdgeInsets.only(right: 12),
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 constraints: BoxConstraints(
//                     minWidth: 100, maxWidth: MediaQuery.of(context).size.width - 24 - 36),
//                 decoration: const BoxDecoration(
//                     color: kBackgroundColor1,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                       bottomRight: Radius.circular(16),
//                     )),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       body,
//                       style: kRegularTextStyle(14),
//                     ).padding(bottom: 4),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           dateTime,
//                           style: kRegularTextStyle(12),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
