import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SpotlightScreen extends StatelessWidget {
  const SpotlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Cinema Spotlight'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'HALL OF FAME SPOTLIGHT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Fernando Poe Jr.',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'The King of Philippine Movies (Da King)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Ronald Allan Kelley Poe, widely known as FPJ, was a Filipino actor, film director, and politician. His cinematic career spanned decades, starring in nearly 300 films and establishing archetypes of Filipino heroism, valor, and social justice.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppTheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: AppTheme.divider),
                  const SizedBox(height: 14),
                  const Text(
                    'Signature Masterpieces:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Ang Panday (1980)\n• Asedillo (1971)\n• Isang Bala Ka Lang! (1983)\n• Batas sa Aking Kamay (1987)',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: AppTheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.military_tech_outlined, size: 28, color: AppTheme.primary),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'National Artist of the Philippines',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Conferred in 2006 for Film and Cinema Heritage',
                          style: TextStyle(fontSize: 12, color: AppTheme.secondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
