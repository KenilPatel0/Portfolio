import 'package:flutter/material.dart';

class JourneyItem {
  final String year;
  final String title;
  final String description;
  final IconData icon;

  JourneyItem({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class Skill {
  final String name;
  final IconData icon;
  final double proficiency;
  final Color color;

  Skill({
    required this.name,
    required this.icon,
    required this.proficiency,
    required this.color,
  });
}

class Project {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final List<String> technologies;
  final Color gradientStart;
  final Color gradientEnd;
  final IconData icon;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.technologies,
    required this.gradientStart,
    required this.gradientEnd,
    required this.icon,
  });
}
