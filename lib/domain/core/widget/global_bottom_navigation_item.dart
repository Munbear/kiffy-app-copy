import 'package:Kiffy/config/router/route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalBottomNavigationItemProps {
  String iconPath;
  String routePath;
  String curRoutePath;

  GlobalBottomNavigationItemProps({
    required this.iconPath,
    required this.routePath,
    required this.curRoutePath,
  });
}

class GlobalBottomNavigationItem extends HookConsumerWidget {
  GlobalBottomNavigationItemProps props;

  GlobalBottomNavigationItem({
    required this.props,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isActive = props.curRoutePath == props.routePath;

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            isActive
                ? Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffB003FA),
                      ),
                    ),
                  )
                : null,
            Positioned(
              child: SizedBox(
                width: 75,
                height: 75,
                child: IconButton(
                  icon: Image.asset(
                    props.iconPath,
                    color: isActive ? const Color(0xffB003FA) : Colors.black,
                  ),
                  onPressed: () {
                    ref.read(routerProvider).replace(props.routePath);
                  },
                ),
              ),
            ),
          ].whereType<Widget>().toList(),
        ),
      ),
    );
  }
}
