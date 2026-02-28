import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';

enum ButtonType { primary, secondary, text, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = AppConstants.buttonHeightMedium,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isLoading) {
      return _buildLoadingButton(isDark);
    }

    switch (type) {
      case ButtonType.primary:
        return _buildPrimaryButton(isDark);
      case ButtonType.secondary:
        return _buildSecondaryButton(isDark);
      case ButtonType.text:
        return _buildTextButton(isDark);
      case ButtonType.outlined:
        return _buildOutlinedButton(isDark);
    }
  }

  Widget _buildPrimaryButton(bool isDark) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
          elevation: AppConstants.elevationLow,
        ),
        child: _buildButtonContent(isDark, Colors.white),
      ),
    );
  }

  Widget _buildSecondaryButton(bool isDark) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark
              ? AppColors.surfaceDark
              : AppColors.surfaceLight,
          foregroundColor: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
          elevation: AppConstants.elevationLow,
        ),
        child: _buildButtonContent(
          isDark,
          isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(bool isDark) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
        ),
        child: _buildButtonContent(isDark, AppColors.primary),
      ),
    );
  }

  Widget _buildTextButton(bool isDark) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
        ),
        child: _buildButtonContent(isDark, AppColors.primary),
      ),
    );
  }

  Widget _buildLoadingButton(bool isDark) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
        ),
        child: const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent(bool isDark, Color color) {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppConstants.iconSizeMedium),
          const SizedBox(width: AppConstants.spacing8),
          Text(
            text,
            style:
                (isDark
                        ? AppTextStyles.buttonMediumDark
                        : AppTextStyles.buttonMediumLight)
                    .copyWith(color: color),
          ),
        ],
      );
    }

    return Text(
      text,
      style:
          (isDark
                  ? AppTextStyles.buttonMediumDark
                  : AppTextStyles.buttonMediumLight)
              .copyWith(color: color),
    );
  }
}
