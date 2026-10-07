import 'package:flutter/material.dart';
import '../../data/actor_data.dart';
import '../../models/actor_model.dart';
import '../../models/user_model.dart';
import '../../theme/app_theme.dart';
import 'actor_profile_screen.dart';

class ActorsDashboardScreen extends StatefulWidget {
  final UserModel user;

  const ActorsDashboardScreen({
    super.key,
    required this.user,
  });

  @override
  State<ActorsDashboardScreen> createState() => _ActorsDashboardScreenState();
}

class _ActorsDashboardScreenState extends State<ActorsDashboardScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Drama', 'Romance', 'Action'];

  List<ActorModel> get _filteredActors {
    return ActorData.actors.where((actor) {
      final matchesSearch = actor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          actor.alias.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          actor.famousWorks.any((work) => work.toLowerCase().contains(_searchQuery.toLowerCase()));

      final matchesCategory = _selectedCategory == 'All' ||
          actor.category.toLowerCase().contains(_selectedCategory.toLowerCase());

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final actors = _filteredActors;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Cinema Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.primary,
              child: Text(
                widget.user.username.isNotEmpty ? widget.user.username[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.surface,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${widget.user.username}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Signed in session',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Filipino actors or films...',
                      prefixIcon: const Icon(Icons.search, size: 20, color: AppTheme.muted),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      filled: true,
                      fillColor: AppTheme.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppTheme.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppTheme.border),
                      ),
                    ),
                    onChanged: (value) => setState(() => _searchQuery = value),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() => _selectedCategory = cat);
                              }
                            },
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              color: isSelected ? Colors.white : AppTheme.secondary,
                            ),
                            selectedColor: AppTheme.primary,
                            backgroundColor: AppTheme.background,
                            side: BorderSide(
                              color: isSelected ? AppTheme.primary : AppTheme.border,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            showCheckmark: false,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(height: 1, color: AppTheme.border),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: actors.isEmpty
                ? const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(
                        child: Text(
                          'No actors found matching your criteria',
                          style: TextStyle(fontSize: 14, color: AppTheme.muted),
                        ),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final actor = actors[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.border),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ActorProfileScreen(actor: actor),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: AppTheme.border,
                                    backgroundImage: NetworkImage(actor.imageUrl),
                                    onBackgroundImageError: (_, _) {},
                                    child: Text(
                                      actor.name.split(' ').map((n) => n[0]).take(2).join(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          actor.name,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.primary,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          actor.alias,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppTheme.secondary,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AppTheme.divider,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                actor.category,
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: AppTheme.secondary,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              '${actor.famousWorks.length} Major Titles',
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: AppTheme.muted,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: AppTheme.muted,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: actors.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
