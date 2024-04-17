import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.secure = false,
    required this.hintText,
    this.validator,
    this.onChange,
    this.keyBoardType,
    this.prefixIcon,
    this.suffixIcon = false,
  });

  final bool secure;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextInputType? keyBoardType;
  final IconData? prefixIcon;
  final bool? suffixIcon;

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool? _showPassword;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _showPassword = widget.secure;
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.dark2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isFocused
              ? AppColors.mainColor.withOpacity(.08)
              : AppColors.dark2,
        ),
        child: Focus(
          focusNode: _focusNode,
          child: TextFormField(
            keyboardType: widget.keyBoardType,
            obscureText: _showPassword!,
            cursorColor: AppColors.white,
            onChanged: widget.onChange,
            style: AppTextStyle.font14whiteSemiBold,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyle.font14Grey500Regular,
              fillColor: _isFocused
                  ? AppColors.mainColor.withOpacity(0.08)
                  : AppColors.dark2,
              filled: true,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: AppColors.grey500,
                      size: 24.sp,
                    )
                  : null,
              suffixIcon: widget.suffixIcon == true
                  ? IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        _showPassword!
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: AppColors.grey500,
                        size: 24.sp,
                      ),
                      onPressed: () =>
                          setState(() => _showPassword = !_showPassword!),
                    )
                  : null,
              enabledBorder: inputBorder(AppColors.dark2),
              focusedBorder: inputBorder(AppColors.mainColor),
              errorBorder: inputBorder(Colors.red[600]!),
              focusedErrorBorder: inputBorder(Colors.red[600]!),
            ),
          ),
        ),
      ),
    );
  }

  InputBorder inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
