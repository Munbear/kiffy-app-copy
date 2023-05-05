// import 'package:Kiffy/config/router/route.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class GlobalBottomNavigationItemProps {
//   String iconPath;
//   String routePath;
//   String curRoutePath;

//   GlobalBottomNavigationItemProps({
//     required this.iconPath,
//     required this.routePath,
//     required this.curRoutePath,
//   });
// }

// class GlobalBottomNavigationItem extends HookConsumerWidget {
//   GlobalBottomNavigationItemProps props;

//   GlobalBottomNavigationItem({
//     required this.props,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var isActive = props.curRoutePath == props.routePath;

//     return Expanded(
//       child: Container(
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             isActive
//                 ? Positioned(
//                     left: 0,
//                     right: 0,
//                     top: 7,
//                     child: Container(
//                       width: 5,
//                       height: 5,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Color(0xffBA00FF),
//                             Color(0xff0031AA),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 : null,
//             Positioned(
//               child: SizedBox(
//                 width: 70,
//                 height: 70,
//                 child: ShaderMask(
//                   blendMode: BlendMode.srcATop,
//                   shaderCallback: (Rect bound) {
//                     return LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         isActive ? const Color(0xffBA00FF) : Colors.black,
//                         isActive ? const Color(0xff0031AA) : Colors.black,
//                       ],
//                     ).createShader(bound);
//                   },
//                   child: IconButton(
//                     onPressed: () => ref.read(routerProvider).replace(props.routePath),
//                     icon: Image.asset(props.iconPath),
//                   ),
//                 ),
//               ),
//             ),
//           ].whereType<Widget>().toList(),
//         ),
//       ),
//     );
//   }
// }
