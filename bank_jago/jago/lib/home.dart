import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔹 HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Assalamu'alaikum,\nudinudon",
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.person_outline, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Icon(Icons.notifications_none, color: Colors.orangeAccent),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 LOGO
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Image.asset('assets/jago.png'),
                    ),
                    const SizedBox(width: 8),
                    const Text("syariah"),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 CARD SWIPE
                SizedBox(
                  height: 140,
                  child: PageView(
                    controller: _controller,
                    children: [
                      _saldoCard("Kantong Utama", "Rp49.157"),
                      _saldoCard("Tabungan", "Rp120.000"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 MENU
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.send, size: 30, color: Colors.orangeAccent),
                            SizedBox(height: 10),
                            Text("Transfer & Bayar"),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.qr_code, size: 30, color: Colors.orangeAccent),
                            SizedBox(height: 10),
                            Text("Scan QRIS"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // 🔹 SPOTLIGHT TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Spotlight",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Lihat Semua"),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔹 SPOTLIGHT BANNER
                SizedBox(
                  height: 150,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.95),
                    children: [
                      _banner("assets/banner-10.png"),
                      _banner("assets/banner-11.png"),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // 🔹 PLAN AHEAD
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Plan Ahead",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("Tutup"),
                  ],
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.assignment,
                          size: 40, color: Colors.orange),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sering lupa bayar tagihan?"),
                          SizedBox(height: 4),
                          Text(
                            "Buat Rencana Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // 🔹 SHORTCUT TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Shortcut",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("Edit"),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔹 GRID SHORTCUT
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  children: [
                    _shortcutItem(Icons.account_balance_wallet,
                        "Kantong Utama", "Rp49.157"),
                    _shortcutItem(Icons.trending_up, "Investasi", "BARU!"),
                    _shortcutItem(Icons.mail, "Jago Amal",
                        "Zakat dan Sedekah"),
                    _shortcutItem(Icons.attach_money, "Saldo Saya",
                        "Rp49.157"),
                    _shortcutItem(Icons.pie_chart, "Auto Budgeting",
                        "BARU!"),
                    _shortcutItem(Icons.card_giftcard, "Ajak Teman",
                        "Bonus"),
                  ],
                ),

                const SizedBox(height: 15),

                // 🔹 TAMBAH SHORTCUT
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.add_circle,
                          size: 40, color: Colors.orangeAccent),
                      SizedBox(height: 10),
                      Text("Tambah Shortcut"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 CARD
  Widget _saldoCard(String title, String saldo) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined, color: Colors.orangeAccent),
                  const SizedBox(width: 8),
                  Text(title,
                      style:
                          const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  Text(saldo,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  const Icon(Icons.visibility_off_outlined, size: 18, color: Colors.orangeAccent),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text("Aktivitas Terakhir"),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 BANNER
  Widget _banner(String path) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 🔹 SHORTCUT
  Widget _shortcutItem(
      IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.orangeAccent),
          const Spacer(),
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle,
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}