import 'package:flutter/material.dart';
import '../../data/actor_data.dart';
import '../../theme/app_theme.dart';
import '../dashboard/actor_profile_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedActors = ActorData.actors.take(2).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Saved Collection'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.divider,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: AppTheme.secondary),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Bookmarks are saved for quick offline reference.',
                    style: TextStyle(fontSize: 12, color: AppTheme.secondary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...savedActors.map((actor) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.border),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppTheme.border,
                  backgroundImage: NetworkImage(actor.imageUrl),
                  onBackgroundImageError: (_, _) {},
                  child: Text(
                    actor.name.split(' ').map((n) => n[0]).take(2).join(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
                title: Text(
                  actor.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                  ),
                ),
                subtitle: Text(
                  actor.alias,
                  style: const TextStyle(fontSize: 12, color: AppTheme.secondary),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppTheme.muted,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ActorProfileScreen(actor: actor),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
