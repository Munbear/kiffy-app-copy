import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainPageController =
    StateProvider<PageController>((ref) => PageController());
final currentPage = StateProvider<int>((ref) => 0);
