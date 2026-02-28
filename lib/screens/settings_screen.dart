import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../core/font_size.dart';
import '../core/spacing.dart';
import '../core/text_styles.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/auth/auth_event.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selected = 0;

  final List<_SettingSection> _sections = const [
    _SettingSection('Account', Icons.person_outline_rounded),
    _SettingSection('Subscription', Icons.workspace_premium_outlined),
    _SettingSection('Categories', Icons.category_outlined),
    _SettingSection('Preferences', Icons.tune_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktopOrTablet = !AppBreakpoints.isMobile(context);
    final user = FirebaseAuth.instance.currentUser;

    if (isDesktopOrTablet) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppBreakpoints.isDesktop(context) ? 4.w : 2.w,
          vertical: 2.h,
        ),
        child: Row(
          children: [
            SizedBox(
              width: AppBreakpoints.isDesktop(context) ? 20.w : 30.w,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListView.builder(
                  itemCount: _sections.length,
                  itemBuilder: (context, index) {
                    final item = _sections[index];
                    final selected = index == _selected;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ListTile(
                        selected: selected,
                        leading: Icon(item.icon, size: 3.h),
                        title: Text(
                          item.title,
                          style: TextStyle(fontSize: AppFontSize.of(13)),
                        ),
                        onTap: () => setState(() => _selected = index),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(child: _detailPanel(user)),
          ],
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      children: [_detailPanel(user)],
    );
  }

  Widget _detailPanel(User? user) {
    final title = _sections[_selected].title;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.displayMedium),
            SizedBox(height: AppSpacing.md),
            if (title == 'Account') ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 2.h,
                  child: Text(
                    ((user?.displayName?.trim().isNotEmpty ?? false)
                            ? user!.displayName!.trim()
                            : 'U')
                        .substring(0, 1)
                        .toUpperCase(),
                  ),
                ),
                title: Text(
                  user?.displayName ?? 'User',
                  style: TextStyle(fontSize: AppFontSize.of(14)),
                ),
                subtitle: Text(
                  user?.email ?? '',
                  style: TextStyle(fontSize: AppFontSize.of(12)),
                ),
              ),
            ],
            if (title == 'Subscription') ...[
              _actionTile(
                Icons.workspace_premium_outlined,
                'Manage Plan',
                () => context.push('/subscription'),
              ),
            ],
            if (title == 'Categories') ...[
              _actionTile(
                Icons.category_outlined,
                'Manage Categories',
                () => context.push('/category/manage'),
              ),
            ],
            if (title == 'Preferences') ...[
              _actionTile(
                Icons.color_lens_outlined,
                'Theme Preferences',
                () {},
              ),
            ],
            SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 6.h,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    const AuthEvent.signOutRequested(),
                  );
                  context.go('/login');
                },
                icon: Icon(Icons.logout_rounded, size: 3.h),
                label: Text(
                  'Logout',
                  style: TextStyle(fontSize: AppFontSize.of(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionTile(IconData icon, String label, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, size: 3.h),
        title: Text(label, style: TextStyle(fontSize: AppFontSize.of(13))),
        trailing: Icon(Icons.chevron_right_rounded, size: 3.h),
        onTap: onTap,
      ),
    );
  }
}

class _SettingSection {
  const _SettingSection(this.title, this.icon);

  final String title;
  final IconData icon;
}
