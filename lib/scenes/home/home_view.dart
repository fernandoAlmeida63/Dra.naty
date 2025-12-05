import 'package:flutter/material.dart';
// import 'home_view_model.dart'; <--- REMOVIDO para corrigir o erro URI e o ';'

// A antiga classe 'DraNatyHome' agora é a 'HomeView'.
class HomeView extends StatelessWidget {
  final Function()? onLogout;

  const HomeView({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FCF9),
      body: Column(
        children: [
          // Logo reutilizado da tela de login
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: SizedBox(
              height: 90,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AppBar(onLogout: onLogout), // Passa a função de logout
                  const _HeaderSection(),
                  const _ScheduleButton(),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 20.0,
                      bottom: 12.0,
                    ),
                    child: Text(
                      'Nossos compromissos',
                      style: TextStyle(
                        color: Color(0xFF0D1B10),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  const _CommitmentsGrid(),
                ],
              ),
            ),
          ),
          const _BottomNavBar(),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final Function()? onLogout;

  const _AppBar({this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 48),
          const Expanded(
            child: Text(
              'DRA.NATY',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D1B10),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
                letterSpacing: -0.015 * 18,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            child: IconButton(
              icon: Icon(
                onLogout != null ? Icons.logout : Icons.shopping_cart_outlined,
                color: const Color(0xFF0D1B10),
              ),
              onPressed: onLogout, // Executa a função de logout
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width >= 480;

    return Padding(
      padding: EdgeInsets.all(isLargeScreen ? 16.0 : 0.0),
      child: Container(
        height: 480,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isLargeScreen ? 8.0 : 0.0),
          image: const DecorationImage(
            image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDI1X2d-ei80dW2kS_JZcb-TzoK70TmpaDxP0Dk_lXkh8-6FG61PE-wwWT10Tqct51fq4-FYhTsOmnn4vX6xLqrmJOx8cSomTgBzR-z0AlpyEVSNfZKD2QzZC2FoeapRC5lwIh6wTxe3MtTXpyAg0OmMtPIWCyT7y6JF_9RCknCUzYEhkuYK3rJuJPiRgsSnkcQUYAXA_hVdoao1meLlCkdvjhy2dAXoxEcGmHZRfe_1VcPcpeAQgZ7GONaEBwZFtvNHzOL7jTCims',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sua conexão confiável com a saúde e bem-estar.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLargeScreen ? 48 : 36,
                fontWeight: FontWeight.w900,
                height: 1.2,
                letterSpacing: -0.033 * (isLargeScreen ? 48 : 36),
              ),
            ),
            const SizedBox(height: 24.0),
            const _SearchBar(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width >= 480;
    final double buttonHeight = isLargeScreen ? 48 : 40;
    final double inputHeight = isLargeScreen ? 64 : 56;

    return Container(
      height: inputHeight,
      constraints: const BoxConstraints(maxWidth: 480),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FCF9),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFFCFE7D4)),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(Icons.search, color: Color(0xFF4C9A5B), size: 20),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF0D1B10),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: 'Buscar medicamentos',
                  hintStyle: TextStyle(color: Color(0xFF4C9A5B)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 7.0),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FCF9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13EC3E),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(84, buttonHeight),
                padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 20 : 16),
              ),
              child: Text(
                'Buscar',
                style: TextStyle(
                  color: const Color(0xFF0D1B10),
                  fontSize: isLargeScreen ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.015 * (isLargeScreen ? 16 : 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleButton extends StatelessWidget {
  const _ScheduleButton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFF13EC3E)),
            elevation: WidgetStatePropertyAll(0),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 40)),
          ),
          child: Text(
            'Agendar Especialista',
            style: TextStyle(
              color: Color(0xFF0D1B10),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.015 * 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _CommitmentsGrid extends StatelessWidget {
  const _CommitmentsGrid();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount =
              (constraints.maxWidth / 170).floor().clamp(1, 3);
          final childAspectRatio =
              constraints.maxWidth / (constraints.maxWidth / crossAxisCount) / 3;

          return GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: childAspectRatio,
            children: const [
              _CommitmentTile(
                icon: Icons.verified_user_outlined,
                title: 'Entrega segura',
              ),
              _CommitmentTile(
                icon: Icons.credit_score,
                title: 'Farmacêuticos certificados',
              ),
              _CommitmentTile(
                icon: Icons.access_time,
                title: 'Suporte 24h',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CommitmentTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CommitmentTile({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FCF9),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFFCFE7D4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0D1B10), size: 24),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF0D1B10),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8FCF9),
        border: Border(
          top: BorderSide(color: Color(0xFFE7F3EA), width: 1.0),
        ),
      ),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 20.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home,
            label: 'Início',
            isSelected: true,
          ),
          _NavBarItem(
            icon: Icons.list_alt,
            label: 'Categorias',
            isSelected: false,
          ),
          _NavBarItem(
            icon: Icons.favorite_border,
            label: 'Favoritos',
            isSelected: false,
          ),
          _NavBarItem(
            icon: Icons.person_outline,
            label: 'Perfil',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected ? const Color(0xFF0D1B10) : const Color(0xFF4C9A5B);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 32,
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.015 * 12,
            ),
          ),
        ],
      ),
    );
  }
}