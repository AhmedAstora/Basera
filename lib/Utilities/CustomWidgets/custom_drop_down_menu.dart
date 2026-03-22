import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Constants/app_color.dart';
import 'LoaderWidget.dart';
import 'custom_text.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  final bool isLoading;
  final T? selectedItem;
  final List<DropdownMenuItem<T>>? items;

  final void Function(T?)? onChange;
  String displayText;
  bool isNotString;

  CustomDropDownMenu({
    super.key,
    this.isLoading = false,
    this.isNotString = true,
    required this.selectedItem,
    required this.items,
    required this.onChange,
    required this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 5.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x4c8b9ee0), Color(0x4ce7d6c9)],
          stops: [0, 1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: isLoading
          ? Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColor.secondary,
                  ),
                ),
              ],
            )
          : DropdownButton<T>(
              underline: Container(),
              icon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Color(0xff8B9EE0), Color(0xffE7D6C9)],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: Icon(Icons.keyboard_arrow_down, size: 35.r),
              ),
              isExpanded: true,
              hint: CustomText(
                'Select a problem type',
                color: Color(0xffE7D6C9),
              ),
              value: selectedItem,
              items: items,
              onChanged: onChange,
            ),
    );
  }
}
