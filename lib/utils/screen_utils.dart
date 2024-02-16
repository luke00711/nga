import 'package:flutter_screenutil/flutter_screenutil.dart';


/// 直接通过`类名称`访问里面的方法和常量，方法为 静态方法
/// 获取 计算后的字体
sp(double value) {
  var scaleText = ScreenUtil().scaleText;
  if (scaleText < 0.9) {
    ///解决部分机型文字显示过小的问题
    return value * 0.9;
  } else {
    return ScreenUtil().setSp(value);
    // return ScreenUtil().setSp(value, allowFontScalingSelf: false);
  }
}

/// 获取 转换后的距离
dp(double value) {
  return ScreenUtil().setWidth(value);
}

/// 屏幕宽度的百分比 0.2sw
sw(double value) {
  return value.sw;
}

/// 屏幕高度的百分比 0.2sh
sh(double value) {
  return value.sh;
}

/// 根据高度换算转换的距离
dpH(double value) {
  return ScreenUtil().setHeight(value);
}

/// 计算后的屏幕高度
double screenHeight = ScreenUtil().screenHeight;

/// 计算后的屏幕宽度
double screenWidth = ScreenUtil().screenWidth;

///状态栏高度 刘海屏会更高
double statusBarHeight = ScreenUtil().statusBarHeight;

///底部安全区距离，适用于全面屏下面有按键的
///在 android获取不到高度，使用时需要注意
double safeBottomBarHeight = ScreenUtil().bottomBarHeight;

///导航栏+状态栏高度
double navBarAndStatusBarHeight = statusBarHeight + 44;

extension ScreenExtension on num {
  double get dp =>   ScreenUtil().setWidth(this);
}
///左边页间距
// double leftMargin = dp(15);
