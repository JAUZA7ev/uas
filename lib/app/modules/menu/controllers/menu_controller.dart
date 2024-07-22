import 'package:get/get.dart';

class MenuController extends GetxController {
  var menuItems = <Map<String, String>>[].obs;
  var cartItems = <Map<String, String>>[].obs;
  var subMenus = <String, List<Map<String, String>>>{
    'Aneka Makanan': [
    {'name': 'Nasi Goreng', 'image': 'assets/nasi_goreng.jpg', 'description': 'Nasi yang digoreng dengan bumbu spesial dan bahan tambahan seperti telur, ayam, dan sayuran', 'price': '50.000', 'origin': 'Indonesia', 'rating': '4.6'},
    {'name': 'Rendang', 'image': 'assets/rendang.jpg', 'description': 'Daging sapi yang dimasak dengan bumbu rendang khas Minangkabau', 'price': '85.000', 'origin': 'Sumatra Barat', 'rating': '4.8'},
    {'name': 'Sate Ayam', 'image': 'assets/sate_ayam.jpg', 'description': 'Sate ayam dengan bumbu kacang yang nikmat', 'price': '55.000', 'origin': 'Indonesia', 'rating': '4.5'},
    {'name': 'Gado-Gado', 'image': 'assets/gado_gado.jpg', 'description': 'Salad sayur dengan saus kacang', 'price': '45.000', 'origin': 'Indonesia', 'rating': '4.4'},
    {'name': 'Bakso', 'image': 'assets/bakso.jpg', 'description': 'Bakso daging sapi dalam kuah kaldu', 'price': '50.000', 'origin': 'Indonesia', 'rating': '4.3'},
    {'name': 'Soto Ayam', 'image': 'assets/soto_ayam.jpg', 'description': 'Sup ayam dengan kuah kuning dan bumbu rempah', 'price': '60.000', 'origin': 'Indonesia', 'rating': '4.6'},
    {'name': 'Ayam Penyet', 'image': 'assets/ayam_penyet.jpg', 'description': 'Ayam goreng yang dipenyet dengan sambal dan disajikan dengan nasi', 'price': '55.000', 'origin': 'Indonesia', 'rating': '4.7'},
    {'name': 'Nasi Padang', 'image': 'assets/nasi_padang.jpg', 'description': 'Nasi dengan berbagai lauk pauk khas Padang', 'price': '70.000', 'origin': 'Sumatra Barat', 'rating': '4.7'},
    {'name': 'Mie Goreng', 'image': 'assets/mie_goreng.jpg', 'description': 'Mie yang digoreng dengan bumbu dan bahan tambahan seperti telur, ayam, dan sayuran', 'price': '50.000', 'origin': 'Indonesia', 'rating': '4.5'},
    {'name': 'Pempek', 'image': 'assets/pempek.jpg', 'description': 'Camilan khas Palembang yang terbuat dari ikan dan tepung tapioka', 'price': '60.000', 'origin': 'Palembang', 'rating': '4.6'},
    {'name': 'Kari Ayam', 'image': 'assets/kari_ayam.jpg', 'description': 'Ayam yang dimasak dengan kuah kari kaya bumbu', 'price': '65.000', 'origin': 'Indonesia', 'rating': '4.4'},
    {'name': 'Nasi Uduk', 'image': 'assets/nasi_uduk.jpg', 'description': 'Nasi yang dimasak dengan santan dan disajikan dengan lauk pelengkap', 'price': '50.000', 'origin': 'Indonesia', 'rating': '4.5'},
    {'name': 'Lontong Sayur', 'image': 'assets/lontong_sayur.jpg', 'description': 'Lontong dengan sayur kuah santan', 'price': '55.000', 'origin': 'Indonesia', 'rating': '4.3'},
    {'name': 'Karedok', 'image': 'assets/karedok.jpg', 'description': 'Salad sayur khas Sunda dengan bumbu kacang', 'price': '45.000', 'origin': 'Jawa Barat', 'rating': '4.4'},
    {'name': 'Tahu Tempe', 'image': 'assets/tahu_tempe.jpg', 'description': 'Tahu dan tempe goreng yang disajikan dengan sambal', 'price': '40.000', 'origin': 'Indonesia', 'rating': '4.2'},
    {'name': 'Ayam Betutu', 'image': 'assets/ayam_betutu.jpg', 'description': 'Ayam yang dimasak dengan bumbu betutu khas Bali', 'price': '75.000', 'origin': 'Bali', 'rating': '4.6'},
    {'name': 'Klepon', 'image': 'assets/klepon.jpg', 'description': 'Kue ketan berisi gula merah dan taburan kelapa', 'price': '30.000', 'origin': 'Indonesia', 'rating': '4.5'},
    {'name': 'Rawon', 'image': 'assets/rawon.jpg', 'description': 'Sup daging dengan kuah hitam khas Jawa Timur', 'price': '70.000', 'origin': 'Jawa Timur', 'rating': '4.7'},
    {'name': 'Bubur Ayam', 'image': 'assets/bubur_ayam.jpg', 'description': 'Bubur nasi dengan topping ayam dan rempah', 'price': '55.000', 'origin': 'Indonesia', 'rating': '4.4'}
]
,
    // 'Aneka Minuman': [
    //   {'name': 'Sop Buntut', 'image': 'assets/sop_buntut.jpg', 'description': 'Sup dengan buntut sapi', 'price': '8.00', 'origin': 'Indonesia'},
    //   {'name': 'Sop Ayam', 'image': 'assets/sop_ayam.jpg', 'description': 'Sup dengan ayam', 'price': '5.50', 'origin': 'Indonesia'},
    // ],

    'Aneka Minuman': [
    {'name': 'Wedang Uwuh', 'image': 'assets/wedang_uwuh.jpg', 'description': 'Minuman tradisional Yogyakarta yang terbuat dari rempah-rempah', 'price': '70.000', 'origin': 'Yogyakarta', 'rating': '4.5'},
    {'name': 'Kawa Daun', 'image': 'assets/kawa_daun.jpg', 'description': 'Minuman khas Padang, Sumatra Barat yang terbuat dari daun kopi', 'price': '65.000', 'origin': 'Padang, Sumatra Barat', 'rating': '4.3'},
    {'name': 'Teh Talua', 'image': 'assets/teh_talua.jpg', 'description': 'Teh telur khas Sumatra Barat', 'price': '55.000', 'origin': 'Sumatra Barat', 'rating': '4.2'},
    {'name': 'Teh Gaharu', 'image': 'assets/teh_gaharu.jpg', 'description': 'Teh dari gaharu khas Banjarbaru', 'price': '80.000', 'origin': 'Banjarbaru, Kalimantan Selatan', 'rating': '4.7'},
    {'name': 'Sarabba', 'image': 'assets/sarabba.jpg', 'description': 'Minuman rempah khas Makassar', 'price': '75.000', 'origin': 'Makassar, Sulawesi Selatan', 'rating': '4.6'},
    {'name': 'le Seureubet', 'image': 'assets/le_seureubet.jpg', 'description': 'Minuman tradisional Aceh dengan rasa yang unik', 'price': '60.000', 'origin': 'Aceh', 'rating': '4.4'},
    {'name': 'Bir Pletok', 'image': 'assets/bir_pletok.jpg', 'description': 'Minuman khas Betawi yang menyegarkan', 'price': '65.000', 'origin': 'Jakarta', 'rating': '4.3'},
    {'name': 'Bajigur', 'image': 'assets/bajigur.jpg', 'description': 'Minuman hangat khas Jawa Barat dengan rasa manis', 'price': '50.000', 'origin': 'Jawa Barat', 'rating': '4.1'},
    {'name': 'Teh Sari Sarang Semut', 'image': 'assets/teh_sari_sarang_semut.jpg', 'description': 'Teh herbal dari Sorong Selatan', 'price': '70.000', 'origin': 'Sorong Selatan, Papua Barat Daya', 'rating': '4.5'},
    {'name': 'Brem Bali', 'image': 'assets/brem_bali.jpg', 'description': 'Minuman beralkohol dari Bali', 'price': '80.000', 'origin': 'Bali', 'rating': '4.8'},
    {'name': 'Es Timun Serut', 'image': 'assets/es_timun_serut.jpg', 'description': 'Minuman segar dari Aceh dengan timun serut', 'price': '60.000', 'origin': 'Aceh', 'rating': '4.4'},
    {'name': 'Toge Panyabungan', 'image': 'assets/toge_panyabungan.jpg', 'description': 'Minuman tradisional dari Sumatra Utara', 'price': '55.000', 'origin': 'Sumatra Utara', 'rating': '4.2'},
    {'name': 'Es Air Mata Pengantin', 'image': 'assets/es_air_mata_pengantin.jpg', 'description': 'Minuman manis khas Riau', 'price': '65.000', 'origin': 'Riau', 'rating': '4.3'},
    {'name': 'Jus Pinang', 'image': 'assets/jus_pinang.jpg', 'description': 'Jus segar dari Jambi', 'price': '55.000', 'origin': 'Jambi', 'rating': '4.1'},
    {'name': 'Es Serbat Kweni', 'image': 'assets/es_serbat_kweni.jpg', 'description': 'Minuman khas Lampung dengan rasa yang segar', 'price': '60.000', 'origin': 'Lampung', 'rating': '4.3'},
    {'name': 'Es Sekemu', 'image': 'assets/es_sekemu.jpg', 'description': 'Minuman tradisional dari Banten', 'price': '65.000', 'origin': 'Banten', 'rating': '4.2'},
    {'name': 'Catemak Jagung', 'image': 'assets/catemak_jagung.jpg', 'description': 'Minuman dari jagung khas Nusa Tenggara Timur', 'price': '70.000', 'origin': 'Nusa Tenggara Timur', 'rating': '4.4'},
    {'name': 'Ce Hun Tiau', 'image': 'assets/ce_hun_tiau.jpg', 'description': 'Minuman segar dari Kalimantan Barat', 'price': '60.000', 'origin': 'Kalimantan Barat', 'rating': '4.2'},
    {'name': 'Es Brenebon', 'image': 'assets/es_brenebon.jpg', 'description': 'Minuman khas Sulawesi Utara dengan rasa unik', 'price': '75.000', 'origin': 'Sulawesi Utara', 'rating': '4.5'},
    {'name': 'Es Saraba', 'image': 'assets/es_saraba.jpg', 'description': 'Minuman segar khas Sulawesi Tengah', 'price': '65.000', 'origin': 'Sulawesi Tengah', 'rating': '4.3'}
]}.obs;

  var favorites = <String>[].obs; // List to store favorite item names

  @override
  void onInit() {
    super.onInit();
    _loadMenuItems();
  }

  void _loadMenuItems() {
    // Simulated data
    menuItems.addAll([
      {'name': 'Aneka Makanan', 'image': 'assets/nasi_goreng.jpg'},
      {'name': 'Aneka Minuman', 'image': 'assets/sop.jpg'},
    ]);
  }

  void addToCart(Map<String, String> menuItem) {
    cartItems.add(menuItem);
    print('${menuItem['name']} added to cart');
  }

  void toggleFavorite(String itemName) {
    if (favorites.contains(itemName)) {
      favorites.remove(itemName);
    } else {
      favorites.add(itemName);
    }
    update(); // Update UI when favorites change
  }

  bool isFavorite(String itemName) {
    return favorites.contains(itemName);
  }
}
