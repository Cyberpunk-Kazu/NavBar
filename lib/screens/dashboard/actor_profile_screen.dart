import 'package:flutter/material.dart';
import '../../models/actor_model.dart';
import '../../theme/app_theme.dart';

class ActorProfileScreen extends StatelessWidget {
  final ActorModel actor;

  const ActorProfileScreen({
    super.key,
    required this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Artist Profile'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              actor.isFavorite ? Icons.bookmark : Icons.bookmark_border,
              size: 22,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    actor.isFavorite
                        ? 'Removed from saved collection'
                        : 'Added to saved collection',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppTheme.surface,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: AppTheme.border,
                    backgroundImage: NetworkImage(actor.imageUrl),
                    onBackgroundImageError: (_, _) {},
                    child: Text(
                      actor.name.split(' ').map((n) => n[0]).take(2).join(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    actor.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                      letterSpacing: -0.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.divider,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      actor.alias,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMetaItem('Experience', '${actor.yearsActive} Years'),
                      Container(width: 1, height: 28, color: AppTheme.border),
                      _buildMetaItem('Rating', actor.rating.toStringAsFixed(1)),
                      Container(width: 1, height: 28, color: AppTheme.border),
                      _buildMetaItem('Genre', actor.category.split(' / ').first),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppTheme.border),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Biography'),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actor.biography,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: AppTheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Divider(height: 1, color: AppTheme.divider),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.cake_outlined, size: 16, color: AppTheme.muted),
                            const SizedBox(width: 6),
                            Text(
                              actor.birthDate,
                              style: const TextStyle(fontSize: 12, color: AppTheme.secondary),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.location_on_outlined, size: 16, color: AppTheme.muted),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                actor.birthPlace,
                                style: const TextStyle(fontSize: 12, color: AppTheme.secondary),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Notable Works & Filmography'),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: actor.famousWorks.length,
                      separatorBuilder: (_, _) =>
                          const Divider(height: 1, color: AppTheme.divider),
                      itemBuilder: (context, index) {
                        return ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          leading: Container(
                            width: 24,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppTheme.divider,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                          title: Text(
                            actor.famousWorks[index],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.primary,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppTheme.muted,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Honors & Accolades'),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Column(
                      children: actor.awards.map((award) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 2, right: 8),
                                child: Icon(
                                  Icons.check_circle_outline,
                                  size: 16,
                                  color: AppTheme.primary,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  award,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppTheme.primary,
        letterSpacing: -0.2,
      ),
    );
  }

  Widget _buildMetaItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppTheme.muted,
          ),
        ),
      ],
    );
  }
}
