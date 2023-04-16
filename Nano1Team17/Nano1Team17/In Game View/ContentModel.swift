//
//  ContentModel.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 24/03/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    // Question Declaration
    struct oneQuestion {
        let area: String
        let pic: String
        let descs: String
    }
    
    @Published var questions: [oneQuestion] = [
        oneQuestion(area: "JAMBI", pic: "Jambi", descs: "Gentala Arasy, sebuah menara jam yang dirancang oleh Hasan Basri Agus berupa museum kebudayaan dengan lebih dari 100 koleksi fakta peninggalan sejarah."),
        oneQuestion(area: "MALUKU", pic: "Maluku", descs: "Cakalele, merupakan tarian perang tradisional bertujuan untuk menyambut tamu dalam perayaan adat yang diiringi dengan musik tiup."),
        oneQuestion(area: "RIAU", pic: "Riau", descs: "Daerah penghasil minyak bumi terbesar di Indonesia 365.827 barel per hari."),
        oneQuestion(area: "GORONTALO", pic: "Gorontalo", descs: "Provinsi di Indonesia yang berasal dari kata Hulontalangi bermakna “Lembah Mulia” dan terletak di bagian utara Pulau Sulawesi."),
        oneQuestion(area: "JAKARTA", pic: "Jakarta", descs: "Roti buaya, sebuah hidangan khas berupa roti manis berbentuk buaya yang senantiasa hadir dalam upacara pernikahan dan kenduri tradisional."),
        oneQuestion(area: "PAPUA", pic: "Papua", descs: "Papeda, makanan tradisional berupa bubur sagu yang biasanya disajikan dengan ikan tongkol atau mubara yang dibumbui dengan kunyit."),
        oneQuestion(area: "BANDUNG", pic: "Bandung", descs: "Gedung Merdeka, lokasi bersejarah yang digunakan sebagai tempat KAA tahun 1955 dan menjadi cikal bakal suatu deklarasi."),
        oneQuestion(area: "SEMARANG", pic: "Semarang", descs: "Pasar Johar, pasar terbesar se-Asia Tenggara yang ditetapkan sebagai cagar budaya sebagai wujud kepedulian terhadap lingkungan dan kesejahteraan pedagang kecil."),
        oneQuestion(area: "KUPANG", pic: "Kupang", descs: "Kota yang dikenal dengan sebutan City of Corals. karna dimana jika di bor atau digali, pembaca akan menemukan batuan karang yang muncul, bukan tanah."),
        oneQuestion(area: "MATARAM", pic: "Mataram", descs: "Ayam Taliwang, makanan tradisional berbahan dasar ayam kampung yang dibakar dan dibumbui rempah-rempah, biasanya disajikan bersama plecing kangkung."),
        oneQuestion(area: "YOGYAKARTA", pic: "Yogyakarta", descs: "Malioboro, lokasi wisata belanja legendaris di Indonesia terdapat para pedagang kaki lima yang menjajakan kerajinan tradisional dan kuliner khas."),
        oneQuestion(area: "PADANG", pic: "Padang", descs: "Rumah Gadang, tradisional suku Minangkabau dengan ciri khas atap gonjong runcing menjulang."),
        oneQuestion(area: "PALEMBANG", pic: "Palembang", descs: "Pempek, makanan tradisional berbahan dasar daging ikan yang digiling dan disajikan dengan kuah asam manis."),
        oneQuestion(area: "MEDAN", pic: "Medan", descs: "Menara Air Tirtanadi, landmark kota yang didirikan pada 1908 oleh pemerintah Belanda sebagai tempat penampungan air masyarakat."),
        oneQuestion(area: "BALI", pic: "Bali", descs: "Ngaben, prosesi upacara pembakaran mayat untuk menyucikan roh umat Hindu yang sudah meninggal dunia dan mempercepat kembalinya jasad ke alam asal."),
        oneQuestion(area: "LAMPUNG", pic: "Lampung", descs: "Menara siger, menara yang dibangun di atas bukit sebelah barat Pelabuhan Bakuheuni dan diresmikan pada 30 April 2008."),
        oneQuestion(area: "BANGKA", pic: "Bangka", descs: "Lempah kuning, makanan tradisional dengan bahan utama berupa ikan laut sebagai akulturasi budaya dan kearifan lokal dalam melestarikan lingkungan."),
        oneQuestion(area: "ACEH", pic: "Aceh", descs: "Tari Saman, tarian tradisional untuk menyampaikan pesan atau dakwah dalam mencerminkan pendidikan, keagamaan, sopan santun, kepahlawanan, kekompakan, dan kebersamaan."),
        oneQuestion(area: "MANADO", pic: "Manado", descs: "Taman Nasional Bunaken, taman laut yang terletak di Segitiga Terumbu Karang dan menjadi perwakilan ekosistem laut Indonesia untuk pertama kalinya.")
    ]
    
    
    
    // Used for whole view
    var timer : Timer?

    // Used for MiddleContentView
    
}
