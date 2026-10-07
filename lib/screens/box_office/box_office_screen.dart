import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class BoxOfficeScreen extends StatelessWidget {
  const BoxOfficeScreen({super.key});

  final List<Map<String, String>> films = const [
    {
      'title': 'Rewind',
      'year': '2023',
      'gross': 'PHP 900+ Million',
      'lead': 'Dingdong Dantes & Marian Rivera',
      'genre': 'Drama / Romance',
    },
    {
      'title': 'Hello, Love, Goodbye',
      'year': '2019',
      'gross': 'PHP 880 Million',
      'lead': 'Kathryn Bernardo & Alden Richards',
      'genre': 'Romance / Drama',
    },
    {
      'title': 'The Hows of Us',
      'year': '2018',
      'gross': 'PHP 805 Million',
      'lead': 'Kathryn Bernardo & Daniel Padilla',
      'genre': 'Romance / Drama',
    },
    {
      'title': 'Seven Sundays',
      'year': '2017',
      'gross': 'PHP 271 Million',
      'lead': 'Dingdong Dantes, Aga Muhlach, Enrique Gil',
      'genre': 'Family / Drama',
    },
    {
      'title': 'Starting Over Again',
      'year': '2014',
      'gross': 'PHP 579 Million',
      'lead': 'Piolo Pascual & Toni Gonzaga',
      'genre': 'Romance / Melodrama',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Box Office Milestones'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: films.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final film = films[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              film['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                          Text(
                            film['year']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.muted,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Gross: ${film['gross']!}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Starring: ${film['lead']!}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
