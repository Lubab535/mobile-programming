import 'package:flutter/material.dart';

const _navy = Color(0xFF123B70);
const _blue = Color(0xFF2878C8);
const _muted = Color(0xFF71839A);

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.userName});

  final String userName;

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$feature akan segera tersedia.')));
  }

  @override
  Widget build(BuildContext context) {
    final displayName = userName.trim().isEmpty ? 'Pelajar' : userName.trim();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTopBar(context, displayName),
                  const SizedBox(height: 24),
                  _buildWelcomeBanner(displayName),
                  const SizedBox(height: 22),
                  _buildSectionHeading('Ringkasan Belajarmu'),
                  const SizedBox(height: 12),
                  _buildStats(),
                  const SizedBox(height: 25),
                  _buildSectionHeading(
                    'Lanjutkan Belajar',
                    trailing: TextButton(
                      onPressed: () => _showComingSoon(context, 'Semua kelas'),
                      style: TextButton.styleFrom(
                        foregroundColor: _blue,
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Lihat semua',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildCourseCard(context),
                  const SizedBox(height: 25),
                  _buildSectionHeading('Akses Cepat'),
                  const SizedBox(height: 12),
                  _buildQuickActions(context),
                  const SizedBox(height: 23),
                  _buildStudyTip(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, String displayName) {
    final initial = displayName.characters.first.toUpperCase();

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _navy,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'RuangBelajar',
            style: TextStyle(
              color: _navy,
              fontSize: 19,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
            ),
          ),
        ),
        IconButton(
          tooltip: 'Notifikasi',
          onPressed: () => _showComingSoon(context, 'Notifikasi'),
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: _navy,
            size: 25,
          ),
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFDCEEFF),
          child: Text(
            initial,
            style: const TextStyle(color: _navy, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeBanner(String displayName) {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_navy, Color(0xFF2878C8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            top: -8,
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 90,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang,',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.82),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Siap belajar hal baru hari ini?',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    color: Color(0xFFFFD36A),
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '3 hari beruntun belajar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 17,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(String title, {Widget? trailing}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF19314D),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.menu_book_rounded,
            value: '4',
            label: 'Kelas aktif',
            color: _blue,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: _buildStatCard(
            icon: Icons.schedule_rounded,
            value: '6 jam',
            label: 'Waktu belajar',
            color: const Color(0xFF24A47A),
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: _buildStatCard(
            icon: Icons.emoji_events_rounded,
            value: '12',
            label: 'Pencapaian',
            color: const Color(0xFFE6A832),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 14, 10, 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: _navy.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 21),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF19314D),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              maxLines: 1,
              style: const TextStyle(color: _muted, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: _navy.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F2FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.calculate_rounded,
                  color: _blue,
                  size: 29,
                ),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Matematika Dasar',
                      style: TextStyle(
                        color: Color(0xFF19314D),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Bab 4 · Persamaan Linear',
                      style: TextStyle(color: _muted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz_rounded, color: _muted),
            ],
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Progress kelas',
                style: TextStyle(color: _muted, fontSize: 12),
              ),
              Text(
                '68%',
                style: TextStyle(
                  color: _navy,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const LinearProgressIndicator(
              value: 0.68,
              minHeight: 8,
              backgroundColor: Color(0xFFEAF0F7),
              valueColor: AlwaysStoppedAnimation<Color>(_blue),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 43,
            child: OutlinedButton.icon(
              onPressed: () => _showComingSoon(context, 'Materi kelas'),
              icon: const Icon(Icons.play_arrow_rounded, size: 20),
              label: const Text(
                'Lanjutkan belajar',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: _blue,
                side: const BorderSide(color: Color(0xFFCBDEF3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      (
        icon: Icons.calendar_month_rounded,
        label: 'Jadwal',
        color: const Color(0xFF2878C8),
      ),
      (
        icon: Icons.assignment_rounded,
        label: 'Tugas',
        color: const Color(0xFFE6A832),
      ),
      (
        icon: Icons.bar_chart_rounded,
        label: 'Nilai',
        color: const Color(0xFF24A47A),
      ),
      (
        icon: Icons.groups_rounded,
        label: 'Komunitas',
        color: const Color(0xFF8A6BC5),
      ),
    ];

    return Row(
      children: [
        for (var index = 0; index < actions.length; index++) ...[
          if (index > 0) const SizedBox(width: 10),
          Expanded(
            child: _buildQuickAction(
              context,
              icon: actions[index].icon,
              label: actions[index].label,
              color: actions[index].color,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => _showComingSoon(context, label),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                maxLines: 1,
                style: const TextStyle(
                  color: Color(0xFF52677E),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudyTip() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FF),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: _blue, size: 22),
          SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips belajar',
                  style: TextStyle(
                    color: _navy,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Belajar 25 menit lalu istirahat sejenak agar tetap fokus.',
                  style: TextStyle(
                    color: Color(0xFF52677E),
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
