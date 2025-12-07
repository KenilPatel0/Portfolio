import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class FocusSection extends StatelessWidget {
  const FocusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 512,
      width: 1380,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Focus',
            style: GoogleFonts.inter(fontSize: 20, color: Color(0xffc4c4c4)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Brand Experience',
                style: AppTheme.focus,
              ),
              Text(
                'Product Design',
                style: AppTheme.focus,
              ),
              Text(
                'Brand Design',
                style: AppTheme.focus,
              ),
              Text(
                'Creative',
                style: AppTheme.focus,
              ),
              Text(
                'Direction',
                style: AppTheme.focus,
              ),
              Text(
                'Motion Design',
                style: AppTheme.focus,
              ),
              Text(
                'Prototyping',
                style: AppTheme.focus,
              ),
              Text(
                'Icon Design',
                style: AppTheme.focus,
              ),
            ],
          )
        ],
      ),
    );
  }
}
