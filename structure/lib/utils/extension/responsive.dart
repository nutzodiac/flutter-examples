import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  /// mobile < 650
  bool isMobile() => MediaQuery.of(this).size.width < 640;

  /// tablet >= 650
  bool isTablet() => MediaQuery.of(this).size.width >= 640 &&  MediaQuery.of(this).size.width < 1024;

  ///desktop >= 1100
  bool isDesktop() => MediaQuery.of(this).size.width >= 1024;

  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1024
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 768
                ? (md ?? sm ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}
