import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/font_size.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.onLogout,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<DesktopDestination> destinations;
  final VoidCallback onLogout;

  String _initials(String? name, String? email) {
    final source = (name?.trim().isNotEmpty ?? false)
        ? name!.trim()
        : (email ?? 'U');
    final chunks = source.split(' ').where((e) => e.isNotEmpty).toList();
    if (chunks.isEmpty) return 'U';
    if (chunks.length == 1) return chunks.first.substring(0, 1).toUpperCase();
    return (chunks[0].substring(0, 1) + chunks[1].substring(0, 1))
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 3.h,
                  color: scheme.primary,
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Text(
                    'Finance Manager',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppFontSize.of(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: ListView.separated(
                itemCount: destinations.length,
                separatorBuilder: (context, index) => SizedBox(height: 0.6.h),
                itemBuilder: (context, index) {
                  final item = destinations[index];
                  final active = index == selectedIndex;
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => onDestinationSelected(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.w,
                          vertical: 1.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: active
                              ? scheme.primary.withValues(alpha: 0.14)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 3.h,
                              color: active
                                  ? scheme.primary
                                  : scheme.onSurfaceVariant,
                            ),
                            SizedBox(width: 1.w),
                            Expanded(
                              child: Text(
                                item.label,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: AppFontSize.of(14),
                                  fontWeight: active
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: active
                                      ? scheme.primary
                                      : scheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            SizedBox(height: 1.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 2.h,
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? Text(
                          _initials(user?.displayName, user?.email),
                          style: TextStyle(
                            fontSize: AppFontSize.of(12),
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : null,
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? 'User',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppFontSize.of(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        user?.email ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppFontSize.of(11),
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 6.w, minHeight: 4.h),
                  onPressed: onLogout,
                  icon: Icon(Icons.logout_rounded, size: 3.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopDestination {
  const DesktopDestination({required this.label, required this.icon});

  final String label;
  final IconData icon;
}
