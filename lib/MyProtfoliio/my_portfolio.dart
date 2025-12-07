import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../Models/models.dart';

// ===== DATA MODELS =====

final List<Project> projects = [
  Project(
    id: '1',
    title: 'E-Commerce Pro',
    description: 'Full-featured shopping app with real-time inventory',
    longDescription:
        'A comprehensive e-commerce solution built with Flutter, featuring real-time inventory management, secure payment integration, advanced search with filters, and a smooth checkout experience. Implemented using clean architecture and BLoC for state management.',
    technologies: ['Flutter', 'Firebase', 'Stripe', 'BLoC'],
    gradientStart: const Color(0xFF6C63FF),
    gradientEnd: const Color(0xFF5A52D5),
    icon: Icons.shopping_bag_outlined,
  ),
  Project(
    id: '2',
    title: 'FitTrack',
    description: 'AI-powered fitness tracking and workout planner',
    longDescription:
        'An intelligent fitness application that uses machine learning to provide personalized workout recommendations. Features include workout tracking, progress analytics, nutrition planning, and social challenges with friends.',
    technologies: ['Flutter', 'TensorFlow Lite', 'GetX', 'Hive'],
    gradientStart: const Color(0xFF00D9FF),
    gradientEnd: const Color(0xFF0099CC),
    icon: Icons.fitness_center_outlined,
  ),
  Project(
    id: '3',
    title: 'ChatSphere',
    description: 'Real-time messaging with end-to-end encryption',
    longDescription:
        'Secure messaging platform with end-to-end encryption, voice/video calls, group chats, and media sharing. Built with focus on privacy and performance, supporting thousands of concurrent users.',
    technologies: ['Flutter', 'WebRTC', 'Socket.io', 'Riverpod'],
    gradientStart: const Color(0xFFFF6B9D),
    gradientEnd: const Color(0xFFC44569),
    icon: Icons.chat_bubble_outline,
  ),
  Project(
    id: '4',
    title: 'TaskMaster',
    description: 'Smart task management with team collaboration',
    longDescription:
        'Professional task management tool with Kanban boards, Gantt charts, time tracking, and team collaboration features. Includes offline-first architecture and real-time synchronization.',
    technologies: ['Flutter', 'GraphQL', 'Provider', 'SQLite'],
    gradientStart: const Color(0xFFFFA726),
    gradientEnd: const Color(0xFFFF6F00),
    icon: Icons.task_alt_outlined,
  ),
  Project(
    id: '5',
    title: 'WeatherWise',
    description: 'Beautiful weather app with advanced forecasting',
    longDescription:
        'Elegant weather application featuring hourly and weekly forecasts, weather maps, severe weather alerts, and beautiful animated backgrounds that match current conditions.',
    technologies: ['Flutter', 'REST API', 'Animations', 'Geolocator'],
    gradientStart: const Color(0xFF56CCF2),
    gradientEnd: const Color(0xFF2F80ED),
    icon: Icons.wb_sunny_outlined,
  ),
  Project(
    id: '6',
    title: 'FoodieHub',
    description: 'Recipe discovery and meal planning platform',
    longDescription:
        'Comprehensive food app with recipe search, meal planning, grocery list generation, and cooking timers. Features AR view for plating suggestions and nutritional information.',
    technologies: ['Flutter', 'ARCore', 'Firebase ML', 'Bloc'],
    gradientStart: const Color(0xFFE17055),
    gradientEnd: const Color(0xFFD63031),
    icon: Icons.restaurant_outlined,
  ),
];

final List<Skill> skills = [
  Skill(
    name: 'Flutter & Dart',
    icon: Icons.flutter_dash,
    proficiency: 0.95,
    color: const Color(0xFF02569B),
  ),
  Skill(
    name: 'UI/UX Design',
    icon: Icons.palette_outlined,
    proficiency: 0.90,
    color: const Color(0xFFFF6B9D),
  ),
  Skill(
    name: 'State Management',
    icon: Icons.account_tree_outlined,
    proficiency: 0.88,
    color: const Color(0xFF6C63FF),
  ),
  Skill(
    name: 'Firebase & Cloud',
    icon: Icons.cloud_outlined,
    proficiency: 0.85,
    color: const Color(0xFFFFA726),
  ),
  Skill(
    name: 'REST & GraphQL',
    icon: Icons.api_outlined,
    proficiency: 0.87,
    color: const Color(0xFF00D9FF),
  ),
  Skill(
    name: 'Animations',
    icon: Icons.animation_outlined,
    proficiency: 0.92,
    color: const Color(0xFF66BB6A),
  ),
];

final List<JourneyItem> journey = [
  JourneyItem(
    year: '2025',
    title: 'Senior Flutter Developer',
    description: 'Leading cross-platform development teams and architecting scalable solutions',
    icon: Icons.rocket_launch_outlined,
  ),
  JourneyItem(
    year: '2023',
    title: 'Flutter Specialist',
    description: 'Built 15+ production apps serving 500K+ users worldwide',
    icon: Icons.apps_outlined,
  ),
  JourneyItem(
    year: '2021',
    title: 'Started Flutter Journey',
    description: 'Fell in love with Flutter\'s hot reload and beautiful UI capabilities',
    icon: Icons.favorite_outlined,
  ),
  JourneyItem(
    year: '2019',
    title: 'Mobile Development',
    description: 'Began mobile development journey with Android and iOS',
    icon: Icons.phone_android_outlined,
  ),
];

class _FloatingCardState extends State<FloatingCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * 15),
          child: Transform.rotate(
            angle: _controller.value * 0.1,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.surface.withOpacity(0.8),
                    theme.colorScheme.surface.withOpacity(0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                color: theme.colorScheme.secondary,
                size: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ===== GLOWING BUTTON =====
class GlowingButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isCompact;

  const GlowingButton({
    Key? key,
    required this.label,
    required this.isPrimary,
    required this.icon,
    required this.onPressed,
    this.isCompact = false,
  }) : super(key: key);

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.isPrimary) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
          child: AnimatedBuilder(
            animation: _glowController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.secondary.withOpacity(
                        _isHovered ? 0.5 + (_glowController.value * 0.3) : 0.3,
                      ),
                      blurRadius: _isHovered ? 30 : 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon, size: widget.isCompact ? 18 : 20),
                  label: Text(widget.label),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.isCompact ? 24 : 32,
                      vertical: widget.isCompact ? 16 : 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: TextStyle(
                      fontSize: widget.isCompact ? 14 : 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: _isHovered
                ? LinearGradient(
                    colors: [
                      theme.colorScheme.secondary.withOpacity(0.1),
                      theme.colorScheme.tertiary.withOpacity(0.1),
                    ],
                  )
                : null,
          ),
          child: OutlinedButton.icon(
            onPressed: widget.onPressed,
            icon: Icon(widget.icon, size: widget.isCompact ? 18 : 20),
            label: Text(widget.label),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
              side: BorderSide(
                color: _isHovered ? theme.colorScheme.secondary : theme.colorScheme.primary.withOpacity(0.3),
                width: 2,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: widget.isCompact ? 24 : 32,
                vertical: widget.isCompact ? 16 : 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: TextStyle(
                fontSize: widget.isCompact ? 14 : 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===== FEATURED PROJECTS SECTION =====
class FeaturedProjectsSection extends StatelessWidget {
  final double scrollOffset;

  const FeaturedProjectsSection({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Featured Projects',
            subtitle: 'Showcasing my best work',
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: isMobile ? 400 : 500,
              childAspectRatio: isMobile ? 0.75 : 0.85,
              crossAxisSpacing: isMobile ? 20 : 32,
              mainAxisSpacing: isMobile ? 20 : 32,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProjectCard(
                project: projects[index],
                index: index,
                scrollOffset: scrollOffset,
              );
            },
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Center(
            child: GlowingButton(
              label: 'View All Projects',
              isPrimary: false,
              icon: Icons.apps,
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              isCompact: isMobile,
            ),
          ),
        ],
      ),
    );
  }
}

// ===== SECTION HEADER =====
class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isMobile;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              theme.colorScheme.secondary,
              theme.colorScheme.tertiary,
            ],
          ).createShader(bounds),
          child: Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: theme.colorScheme.primary.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ===== PROJECT CARD =====
class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final double scrollOffset;

  const ProjectCard({
    Key? key,
    required this.project,
    required this.index,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ProjectDetailPage(project: widget.project),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -12.0 : 0.0)
            ..rotateZ(_isHovered ? -0.01 : 0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.surface.withOpacity(0.8),
                          theme.colorScheme.surface.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: _isHovered ? widget.project.gradientStart.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _isHovered ? widget.project.gradientStart.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                          blurRadius: _isHovered ? 40 : 20,
                          offset: Offset(0, _isHovered ? 20 : 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Hero(
                            tag: 'project_${widget.project.id}',
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    widget.project.gradientStart,
                                    widget.project.gradientEnd,
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  topRight: Radius.circular(26),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedBuilder(
                                    animation: _shimmerController,
                                    builder: (context, child) {
                                      return Positioned(
                                        left: -200 + (_shimmerController.value * 600),
                                        top: -100,
                                        child: Container(
                                          width: 200,
                                          height: 400,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0),
                                                Colors.white.withOpacity(0.2),
                                                Colors.white.withOpacity(0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Center(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 400),
                                      transform: Matrix4.identity()
                                        ..scale(_isHovered ? 1.2 : 1.0)
                                        ..rotateZ(_isHovered ? 0.1 : 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          widget.project.icon,
                                          size: 56,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.project.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: Text(
                                    widget.project.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.colorScheme.primary.withOpacity(0.6),
                                      height: 1.5,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: widget.project.technologies
                                      .take(3)
                                      .map((tech) => Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: widget.project.gradientStart.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: widget.project.gradientStart.withOpacity(0.3),
                                              ),
                                            ),
                                            child: Text(
                                              tech,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: widget.project.gradientStart,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_isHovered)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            widget.project.gradientStart.withOpacity(0.1),
                            widget.project.gradientEnd.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const HomePage({Key? key, required this.onThemeToggle}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;
  late AnimationController _heroAnimController;
  late AnimationController _floatingAnimController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() => _scrollOffset = _scrollController.offset);
    });

    _heroAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _floatingAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _heroAnimController.dispose();
    _floatingAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedBackground(),
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: GlassAppBar(
                  onThemeToggle: widget.onThemeToggle,
                  scrollOffset: _scrollOffset,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HeroSection(
                      animController: _heroAnimController,
                      floatingController: _floatingAnimController,
                    ),
                    const SizedBox(height: 80),
                    FeaturedProjectsSection(scrollOffset: _scrollOffset),
                    const SizedBox(height: 100),
                    SkillsSection(scrollOffset: _scrollOffset),
                    const SizedBox(height: 100),
                    JourneySection(scrollOffset: _scrollOffset),
                    const SizedBox(height: 100),
                    const AboutSection(),
                    const SizedBox(height: 100),
                    const ContactSection(),
                    const SizedBox(height: 40),
                    const FooterSection(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===== ANIMATED BACKGROUND =====

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _particleController;
  late AnimationController _glassController;
  late List<Particle> _particles;
  late List<GlassOrb> _glassOrbs;

  @override
  void initState() {
    super.initState();

    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();

    _glassController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _particles = List.generate(25, (index) => Particle());
    _glassOrbs = List.generate(4, (index) => GlassOrb(index));
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _particleController.dispose();
    _glassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: Listenable.merge([_gradientController, _particleController, _glassController]),
      builder: (context, child) {
        return Stack(
          children: [
            // Base sophisticated gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          const Color(0xFF0A0E27),
                          const Color(0xFF1A1F3A),
                          const Color(0xFF0F1729),
                        ]
                      : [
                          const Color(0xFFF5F7FA),
                          const Color(0xFFE8EDF5),
                          const Color(0xFFF0F4F8),
                        ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            // Subtle animated gradient overlay
            // CustomPaint(
            //   painter: AnimatedGradientPainter(
            //     animation: _gradientController.value,
            //     isDark: isDark,
            //   ),
            //   size: size,
            // ),
            // Glassmorphism orbs
            // ...List.generate(_glassOrbs.length, (index) {
            //   final orb = _glassOrbs[index];
            //   orb.update(_glassController.value, size);
            //   return Positioned(
            //     left: orb.x,
            //     top: orb.y,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(orb.size / 2),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            //         child: Container(
            //           width: orb.size,
            //           height: orb.size,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(orb.size / 2),
            //             gradient: LinearGradient(
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomRight,
            //               colors: isDark
            //                   ? [
            //                       Colors.white.withOpacity(0.08),
            //                       Colors.white.withOpacity(0.03),
            //                     ]
            //                   : [
            //                       Colors.white.withOpacity(0.4),
            //                       Colors.white.withOpacity(0.1),
            //                     ],
            //             ),
            //             border: Border.all(
            //               color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.3),
            //               width: 1.5,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
            // Subtle sparkle particles
            CustomPaint(
              painter: ParticlePainter(
                particles: _particles,
                animation: _particleController.value,
                isDark: isDark,
              ),
              size: size,
            ),
            // Professional grid overlay
            CustomPaint(
              painter: GridPainter(
                color: isDark ? Colors.white.withOpacity(0.015) : Colors.black.withOpacity(0.02),
              ),
              size: size,
            ),
            // Ambient light spots
            // CustomPaint(
            //   painter: AmbientLightPainter(
            //     animation: _gradientController.value,
            //     isDark: isDark,
            //   ),
            //   size: size,
            // ),
          ],
        );
      },
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double size;
  late double speed;
  late double opacity;
  late double twinklePhase;
  late double lifetime;

  Particle() {
    reset();
    y = math.Random().nextDouble();
  }

  void reset() {
    x = math.Random().nextDouble();
    y = -0.05;
    size = math.Random().nextDouble() * 1.2 + 0.8;
    speed = math.Random().nextDouble() * 0.008 + 0.004;
    opacity = math.Random().nextDouble() * 0.4 + 0.3;
    twinklePhase = math.Random().nextDouble() * 2 * math.pi;
    lifetime = 0;
  }

  void update() {
    y += speed;
    lifetime += 0.01;
    if (y > 1.05) reset();
  }
}

class GlassOrb {
  late double x;
  late double y;
  late double size;
  late double speedX;
  late double speedY;
  final int index;

  GlassOrb(this.index) {
    final random = math.Random(index);
    size = random.nextDouble() * 150 + 200;
    speedX = random.nextDouble() * 0.3 + 0.2;
    speedY = random.nextDouble() * 0.2 + 0.1;
    x = 0;
    y = 0;
  }

  void update(double animation, Size screenSize) {
    x = screenSize.width * ((speedX * animation + index * 0.25) % 1.0) - size / 2;
    y = screenSize.height * (0.2 + math.sin(animation * 2 * math.pi * speedY + index) * 0.3) - size / 2;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animation;
  final bool isDark;

  ParticlePainter({
    required this.particles,
    required this.animation,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update();

      final twinkle = (math.sin(animation * 20 + particle.twinklePhase) * 0.5 + 0.5);
      final fadeIn = math.min(particle.lifetime * 20, 1.0);
      final currentOpacity = particle.opacity * twinkle * fadeIn;

      // Subtle glow
      final glowPaint = Paint()
        ..color = (isDark ? Colors.white : Colors.blue.shade200).withOpacity(currentOpacity * 0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.size * 2,
        glowPaint,
      );

      // Core sparkle
      final corePaint = Paint()..color = (isDark ? Colors.white : Colors.blue.shade100).withOpacity(currentOpacity * 0.8);

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.size * 0.6,
        corePaint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class AnimatedGradientPainter extends CustomPainter {
  final double animation;
  final bool isDark;

  AnimatedGradientPainter({required this.animation, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Create smooth color waves
    for (int i = 0; i < 2; i++) {
      final path = Path();
      final offset = animation * 2 * math.pi + (i * math.pi);

      path.moveTo(0, size.height * 0.3);

      for (double x = 0; x <= size.width; x += 5) {
        final y =
            size.height * 0.4 + math.sin(x / size.width * 3 * math.pi + offset) * 80 + math.cos(x / size.width * 1.5 * math.pi - offset * 0.5) * 40;
        path.lineTo(x, y);
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      paint.shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [
                const Color(0xFF1E3A5F).withOpacity(0.15 - i * 0.05),
                const Color(0xFF2D1B4E).withOpacity(0.1 - i * 0.04),
                Colors.transparent,
              ]
            : [
                const Color(0xFF6B9FD5).withOpacity(0.08 - i * 0.03),
                const Color(0xFF8B7FC8).withOpacity(0.05 - i * 0.02),
                Colors.transparent,
              ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(AnimatedGradientPainter oldDelegate) => true;
}

class AmbientLightPainter extends CustomPainter {
  final double animation;
  final bool isDark;

  AmbientLightPainter({required this.animation, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    // Top left ambient light
    paint.shader = RadialGradient(
      colors: isDark
          ? [
              const Color(0xFF3B5998).withOpacity(0.15),
              Colors.transparent,
            ]
          : [
              const Color(0xFFB8D4F1).withOpacity(0.3),
              Colors.transparent,
            ],
    ).createShader(Rect.fromCircle(
      center: Offset(
        size.width * (0.2 + math.cos(animation * 2 * math.pi) * 0.1),
        size.height * (0.2 + math.sin(animation * 2 * math.pi) * 0.1),
      ),
      radius: 300,
    ));
    canvas.drawCircle(
      Offset(
        size.width * (0.2 + math.cos(animation * 2 * math.pi) * 0.1),
        size.height * (0.2 + math.sin(animation * 2 * math.pi) * 0.1),
      ),
      300,
      paint,
    );

    // Bottom right ambient light
    paint.shader = RadialGradient(
      colors: isDark
          ? [
              const Color(0xFF6B4C9A).withOpacity(0.12),
              Colors.transparent,
            ]
          : [
              const Color(0xFFD4C5F0).withOpacity(0.25),
              Colors.transparent,
            ],
    ).createShader(Rect.fromCircle(
      center: Offset(
        size.width * (0.8 - math.cos(animation * 2 * math.pi) * 0.1),
        size.height * (0.7 - math.sin(animation * 2 * math.pi) * 0.1),
      ),
      radius: 350,
    ));
    canvas.drawCircle(
      Offset(
        size.width * (0.8 - math.cos(animation * 2 * math.pi) * 0.1),
        size.height * (0.7 - math.sin(animation * 2 * math.pi) * 0.1),
      ),
      350,
      paint,
    );
  }

  @override
  bool shouldRepaint(AmbientLightPainter oldDelegate) => true;
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    const spacing = 60.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => false;
}

// ===== GLASS APP BAR =====
class GlassAppBar extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final double scrollOffset;

  const GlassAppBar({
    Key? key,
    required this.onThemeToggle,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasScrolled = scrollOffset > 50;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: hasScrolled ? 20 : 10,
            sigmaY: hasScrolled ? 20 : 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.black.withOpacity(hasScrolled ? 0.3 : 0.1) : Colors.white.withOpacity(hasScrolled ? 0.7 : 0.3),
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.secondary.withOpacity(0.2),
                  width: hasScrolled ? 1 : 0,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: 12),
                child: Row(
                  children: [
                    // Logo
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.secondary,
                            theme.colorScheme.tertiary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.secondary.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.code,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    if (!isMobile) ...[
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Kenil Ribadiya',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            'Flutter Developer',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.primary.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const Spacer(),
                    if (size.width > 800) ...[
                      NavButton(
                        label: 'Home',
                        onPressed: () => Navigator.pushNamed(context, '/'),
                      ),
                      NavButton(
                        label: 'Projects',
                        onPressed: () => Navigator.pushNamed(context, '/projects'),
                      ),
                      NavButton(
                        label: 'Contact',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                    ],
                    ThemeToggleButton(onToggle: onThemeToggle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===== NAV BUTTON =====
class NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const NavButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
        child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            foregroundColor: _isHovered ? theme.colorScheme.secondary : theme.colorScheme.primary.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

// ===== THEME TOGGLE BUTTON =====
class ThemeToggleButton extends StatefulWidget {
  final VoidCallback onToggle;

  const ThemeToggleButton({Key? key, required this.onToggle}) : super(key: key);

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.rotationZ(_isHovered ? 0.1 : 0),
        child: IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
              color: isDark ? const Color(0xFFFFA726) : const Color(0xFF6C63FF),
            ),
          ),
          iconSize: 24,
          onPressed: () {
            _controller.forward().then((_) => _controller.reverse());
            widget.onToggle();
          },
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            padding: const EdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}

// ===== HERO SECTION =====
class HeroSection extends StatelessWidget {
  final AnimationController animController;
  final AnimationController floatingController;

  const HeroSection({
    Key? key,
    required this.animController,
    required this.floatingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 80 : (isTablet ? 120 : 160),
      ),
      child: isMobile || isTablet
          ? Column(
              children: [
                _buildContent(context, theme, isMobile),
                SizedBox(height: isMobile ? 40 : 60),
                _buildFloatingElement(theme, isMobile),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildContent(context, theme, false),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 2,
                  child: _buildFloatingElement(theme, false),
                ),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, bool isMobile) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.3, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animController,
          curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 20, vertical: isMobile ? 8 : 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.secondary,
                    theme.colorScheme.tertiary,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Available for Projects',
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: isMobile ? 24 : 40),
            // Main heading
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withOpacity(0.7),
                ],
              ).createShader(bounds),
              child: Text(
                'Crafting Pixel-Perfect',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 68,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1,
                  letterSpacing: -2,
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  theme.colorScheme.secondary,
                  theme.colorScheme.tertiary,
                ],
              ).createShader(bounds),
              child: Text(
                'Flutter Experiences',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 68,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1,
                  letterSpacing: -2,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 28),
            Text(
              'I transform ideas into beautiful, performant cross-platform applications. With a passion for clean code and stunning UI, I create digital experiences that users love.',
              style: TextStyle(
                fontSize: isMobile ? 15 : 19,
                height: 1.7,
                color: theme.colorScheme.primary.withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: isMobile ? 32 : 48),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                GlowingButton(
                  label: 'View My Work',
                  isPrimary: true,
                  icon: Icons.arrow_forward,
                  onPressed: () => Navigator.pushNamed(context, '/projects'),
                  isCompact: isMobile,
                ),
                GlowingButton(
                  label: 'Download CV',
                  isPrimary: false,
                  icon: Icons.download,
                  onPressed: () {},
                  isCompact: isMobile,
                ),
              ],
            ),
            SizedBox(height: isMobile ? 32 : 48),
            // Stats
            Wrap(
              spacing: isMobile ? 24 : 40,
              runSpacing: isMobile ? 20 : 24,
              children: [
                _StatItem(number: '20+', label: 'Projects', isMobile: isMobile),
                _StatItem(number: '500K+', label: 'Users', isMobile: isMobile),
                _StatItem(number: '5+', label: 'Years Exp', isMobile: isMobile),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingElement(ThemeData theme, bool isMobile) {
    return AnimatedBuilder(
      animation: floatingController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            math.sin(floatingController.value * 2 * math.pi) * (isMobile ? 15 : 20),
          ),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.05).animate(
              CurvedAnimation(
                parent: floatingController,
                curve: Curves.easeInOut,
              ),
            ),
            child: Container(
              height: isMobile ? 300 : 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.3),
                    blurRadius: 60,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.secondary.withOpacity(0.1),
                          theme.colorScheme.tertiary.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Stack(
                      children: [
                        if (!isMobile) ...[
                          Positioned(
                            top: 40,
                            right: 40,
                            child: FloatingCard(delay: 0),
                          ),
                          Positioned(
                            bottom: 60,
                            left: 40,
                            child: FloatingCard(delay: 500),
                          ),
                          Positioned(
                            top: 120,
                            left: 60,
                            child: FloatingCard(delay: 1000, icon: Icons.code),
                          ),
                        ],
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(isMobile ? 30 : 40),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.secondary.withOpacity(0.3),
                                  theme.colorScheme.tertiary.withOpacity(0.3),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.flutter_dash,
                              size: isMobile ? 70 : 100,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final bool isMobile;

  const _StatItem({required this.number, required this.label, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              theme.colorScheme.secondary,
              theme.colorScheme.tertiary,
            ],
          ).createShader(bounds),
          child: Text(
            number,
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: theme.colorScheme.primary.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ===== FLOATING CARD =====
class FloatingCard extends StatefulWidget {
  final int delay;
  final IconData icon;

  const FloatingCard({
    Key? key,
    required this.delay,
    this.icon = Icons.widgets,
  }) : super(key: key);

  @override
  State<FloatingCard> createState() => _FloatingCardState();
}

// ===== GLOWING BUTTON =====

// ===== SKILLS SECTION =====
class SkillsSection extends StatelessWidget {
  final double scrollOffset;

  const SkillsSection({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface.withOpacity(0.5),
            theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SectionHeader(
              title: 'Skills & Expertise',
              subtitle: 'Technologies I work with daily',
            ),
            const SizedBox(height: 80),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: skills.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;
                return SizedBox(
                  width: 200,
                  child: SkillCard(
                    skill: skill,
                    delay: index * 100,
                    scrollOffset: scrollOffset,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== SKILL CARD =====
class SkillCard extends StatefulWidget {
  final Skill skill;
  final int delay;
  final double scrollOffset;

  const SkillCard({
    Key? key,
    required this.skill,
    required this.delay,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isVisible = false;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    Future.delayed(Duration(milliseconds: widget.delay + 500), () {
      if (mounted) {
        setState(() => _isVisible = true);
        _progressController.forward();
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        child: AnimatedScale(
          scale: _isVisible ? 1 : 0.8,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.colorScheme.surface.withOpacity(0.8),
                        theme.colorScheme.surface.withOpacity(0.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _isHovered ? widget.skill.color.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _isHovered ? widget.skill.color.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                        blurRadius: _isHovered ? 30 : 15,
                        offset: Offset(0, _isHovered ? 15 : 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.skill.color.withOpacity(0.2),
                              widget.skill.color.withOpacity(0.1),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.skill.icon,
                          size: 40,
                          color: widget.skill.color,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.skill.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Circular progress
                      AnimatedBuilder(
                        animation: _progressController,
                        builder: (context, child) {
                          return SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              children: [
                                // Background circle
                                CircularProgressIndicator(
                                  value: 1.0,
                                  strokeWidth: 6,
                                  backgroundColor: widget.skill.color.withOpacity(0.1),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.skill.color.withOpacity(0.1),
                                  ),
                                ),
                                // Animated progress
                                CircularProgressIndicator(
                                  value: _progressController.value * widget.skill.proficiency,
                                  strokeWidth: 6,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.skill.color,
                                  ),
                                ),
                                // Percentage text
                                Center(
                                  child: Text(
                                    '${(_progressController.value * widget.skill.proficiency * 100).toInt()}%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===== CONTACT SECTION =====
class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.secondary,
            theme.colorScheme.tertiary,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.rocket_launch,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Let\'s Build Something Amazing',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Have an exciting project? Let\'s collaborate and create something extraordinary together.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: const [
              ContactButton(
                label: 'Email Me',
                icon: Icons.email_outlined,
              ),
              ContactButton(
                label: 'LinkedIn',
                icon: Icons.business_center_outlined,
              ),
              ContactButton(
                label: 'GitHub',
                icon: Icons.code,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===== CONTACT BUTTON =====
class ContactButton extends StatefulWidget {
  final String label;
  final IconData icon;

  const ContactButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(widget.icon, size: 20),
          label: Text(widget.label),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1A1A2E),
            elevation: _isHovered ? 20 : 10,
            shadowColor: Colors.black.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

// ===== FOOTER =====
class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.secondary,
                  theme.colorScheme.tertiary,
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '© ${DateTime.now().year} Kenil Ribadiya',
            style: TextStyle(
              color: theme.colorScheme.primary.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Built with',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.favorite,
                color: theme.colorScheme.secondary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'using Flutter',
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===== PROJECTS PAGE =====
class ProjectsPage extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const ProjectsPage({Key? key, required this.onThemeToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedBackground(),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: GlassAppBar(
                  onThemeToggle: onThemeToggle,
                  scrollOffset: 0,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      SectionHeader(
                        title: 'All Projects',
                        subtitle: 'A showcase of my work',
                      ),
                      const SizedBox(height: 60),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 500,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: projects[index],
                            index: index,
                            scrollOffset: 0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===== PROJECT DETAIL PAGE =====
class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: false,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 900;

                      if (isNarrow) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImage(theme),
                            const SizedBox(height: 40),
                            _buildInfo(theme),
                            const SizedBox(height: 60),
                            _buildDetails(theme),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: _buildImage(theme)),
                              const SizedBox(width: 40),
                              Expanded(flex: 2, child: _buildInfo(theme)),
                            ],
                          ),
                          const SizedBox(height: 80),
                          _buildDetails(theme),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    return Hero(
      tag: 'project_${project.id}',
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              project.gradientStart,
              project.gradientEnd,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: project.gradientStart.withOpacity(0.4),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            project.icon,
            size: 150,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                project.gradientStart.withOpacity(0.2),
                project.gradientEnd.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Featured Project',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: project.gradientStart,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          project.title,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          project.description,
          style: TextStyle(
            fontSize: 18,
            color: theme.colorScheme.primary.withOpacity(0.7),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: project.technologies
              .map((tech) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          project.gradientStart.withOpacity(0.1),
                          project.gradientEnd.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: project.gradientStart.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: project.gradientStart,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            GlowingButton(
              label: 'Live Demo',
              isPrimary: true,
              icon: Icons.launch,
              onPressed: () {},
            ),
            GlowingButton(
              label: 'View Code',
              isPrimary: false,
              icon: Icons.code,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Overview',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          project.longDescription,
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.primary.withOpacity(0.7),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Key Features',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        ...[
          'Intuitive and beautiful user interface',
          'Smooth animations and transitions',
          'Offline-first architecture',
          'Real-time data synchronization',
          'Comprehensive error handling',
          'Optimized performance',
        ].map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          project.gradientStart,
                          project.gradientEnd,
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.colorScheme.primary.withOpacity(0.7),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

// ===== IMPROVED JOURNEY SECTION =====
class JourneySection extends StatelessWidget {
  final double scrollOffset;

  const JourneySection({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          SectionHeader(
            title: 'My Journey',
            subtitle: 'A timeline of my growth',
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 40 : 80),
          ...journey.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return JourneyCard(
              item: item,
              index: index,
              isLast: index == journey.length - 1,
              isMobile: isMobile,
            );
          }).toList(),
        ],
      ),
    );
  }
}

// ===== IMPROVED JOURNEY CARD =====
class JourneyCard extends StatefulWidget {
  final JourneyItem item;
  final int index;
  final bool isLast;
  final bool isMobile;

  const JourneyCard({
    Key? key,
    required this.item,
    required this.index,
    required this.isLast,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<JourneyCard> createState() => _JourneyCardState();
}

class _JourneyCardState extends State<JourneyCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.isMobile) {
      return _buildMobileLayout(theme);
    }

    final isEven = widget.index % 2 == 0;
    return AnimatedOpacity(
      opacity: _isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 600),
      child: AnimatedSlide(
        offset: Offset(_isVisible ? 0 : (isEven ? -0.3 : 0.3), 0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            children: [
              if (isEven) ...[
                Expanded(child: _buildContent(theme)),
                const SizedBox(width: 40),
                _buildTimeline(theme),
                const Expanded(child: SizedBox()),
              ] else ...[
                const Expanded(child: SizedBox()),
                _buildTimeline(theme),
                const SizedBox(width: 40),
                Expanded(child: _buildContent(theme)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(ThemeData theme) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 600),
      child: AnimatedSlide(
        offset: Offset(0, _isVisible ? 0 : 0.3),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimeline(theme),
              const SizedBox(width: 20),
              Expanded(child: _buildContent(theme)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline(ThemeData theme) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(widget.isMobile ? 12 : 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.tertiary,
              ],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.secondary.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            widget.item.icon,
            color: Colors.white,
            size: widget.isMobile ? 20 : 24,
          ),
        ),
        if (!widget.isLast)
          Container(
            width: 2,
            height: widget.isMobile ? 60 : 80,
            margin: EdgeInsets.symmetric(vertical: widget.isMobile ? 4 : 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.secondary,
                  theme.colorScheme.tertiary,
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(ThemeData theme) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.isMobile ? 16 : 20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(widget.isMobile ? 20 : 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.surface.withOpacity(0.8),
                    theme.colorScheme.surface.withOpacity(0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.isMobile ? 16 : 20),
                border: Border.all(
                  color: _isHovered ? theme.colorScheme.secondary.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered ? theme.colorScheme.secondary.withOpacity(0.2) : Colors.black.withOpacity(0.1),
                    blurRadius: _isHovered ? 20 : 10,
                    offset: Offset(0, _isHovered ? 10 : 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.isMobile ? 10 : 12,
                      vertical: widget.isMobile ? 4 : 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.secondary.withOpacity(0.2),
                          theme.colorScheme.tertiary.withOpacity(0.2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.item.year,
                      style: TextStyle(
                        fontSize: widget.isMobile ? 12 : 14,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  SizedBox(height: widget.isMobile ? 12 : 16),
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontSize: widget.isMobile ? 18 : 20,
                      fontWeight: FontWeight.w800,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: widget.isMobile ? 6 : 8),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: widget.isMobile ? 13 : 14,
                      color: theme.colorScheme.primary.withOpacity(0.6),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool isMobile;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.color,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 6 : 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: isMobile ? 16 : 20, color: color),
        ),
        SizedBox(width: isMobile ? 8 : 12),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// ===== IMPROVED ABOUT SECTION =====
class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          SectionHeader(
            title: 'About Me',
            subtitle: 'Get to know me better',
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          if (isMobile || isTablet)
            Column(
              children: [
                _buildAvatar(theme, isMobile),
                SizedBox(height: isMobile ? 32 : 40),
                _buildContent(theme, isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatar(theme, false),
                const SizedBox(width: 60),
                Expanded(child: _buildContent(theme, false)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(ThemeData theme, bool isMobile) {
    return Container(
      width: isMobile ? 150 : 200,
      height: isMobile ? 150 : 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.secondary,
            theme.colorScheme.tertiary,
          ],
        ),
        borderRadius: BorderRadius.circular(isMobile ? 24 : 30),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'KR',
          style: TextStyle(
            fontSize: isMobile ? 56 : 72,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, bool isMobile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isMobile ? 24 : 30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 24 : 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.surface.withOpacity(0.8),
                theme.colorScheme.surface.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(isMobile ? 24 : 30),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kenil Ribadiya',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: isMobile ? 10 : 12),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 16,
                  vertical: isMobile ? 6 : 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.secondary,
                      theme.colorScheme.tertiary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Flutter Developer | UI/UX Enthusiast',
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 20 : 24),
              Text(
                'I\'m a passionate Flutter developer with a deep love for creating beautiful, performant applications. My journey in mobile development has been driven by curiosity and a constant desire to learn and improve.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: theme.colorScheme.primary.withOpacity(0.7),
                  height: 1.7,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'When I\'m not coding, you\'ll find me exploring new design trends, contributing to open-source projects, or sharing knowledge with the developer community.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: theme.colorScheme.primary.withOpacity(0.7),
                  height: 1.7,
                ),
              ),
              SizedBox(height: isMobile ? 24 : 32),
              Wrap(
                spacing: isMobile ? 12 : 24,
                runSpacing: isMobile ? 12 : 16,
                children: [
                  _InfoRow(
                    icon: Icons.location_on_outlined,
                    text: 'Bengaluru, India',
                    color: theme.colorScheme.secondary,
                    isMobile: isMobile,
                  ),
                  _InfoRow(
                    icon: Icons.work_outline,
                    text: 'Available for projects',
                    color: theme.colorScheme.tertiary,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(_isHovered ? 4 : 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: _isHovered ? theme.colorScheme.secondary : theme.colorScheme.primary.withOpacity(0.5),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _isHovered ? theme.colorScheme.secondary : theme.colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered ? widget.color.withOpacity(0.1) : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered ? widget.color.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                width: 2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: 20,
              color: _isHovered ? widget.color : Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
