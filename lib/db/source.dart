enum Code {
  engineBearing,
  crankshaft,
  connectionRod,
  pistonRingLiner,
  valves,
  turbocharger,
  threadedFastener,
  gear,
  shaft,
  bearing,
  gearPump,
  vanePump,
  pistonPumpMotor,
}

enum Category {
  engine,
  powertrain,
  hydraulic,
}

enum ResultCode {
  abrasiveWear,
  adhesiveWear,
  corrosionWear,
  erosionWear,
  cavitationErosion,
  contactStressFatigue,
  frettingCorrosion,
  brittleFracture,
  ductileFracture,
  fatigueFracture,
  plasticYealding,
  electricalFitting,
  damageDueInstallation,
  overheating,
  overpressure,
  bendingFatigue,
  reverseBendingFatigue,
  rotatingBendingFatigue,
  torsionalFatigue,
  goodCondition,
}

class Question {
  String question;
  List<String> images;
  int positiveAnswerIndexCursor;
  int negativeAnswerIndexCursor;

  Question(this.question, this.images, this.positiveAnswerIndexCursor, this.negativeAnswerIndexCursor);
}

class Result {
  String title;
  String definition;
  List<String> causes;
  List<String> images;

  Result(this.title, this.definition, this.images, this.causes);

  Result copyWith({causes}) {
    return Result(title, definition, images, causes);
  }
}

class Engine {
  String name;
  Code code;
  Category category;
  bool availability;
  List<Question> questions;
  Map<String, Result?> results;

  Engine(this.name, this.code, this.category, this.availability, this.questions, this.results);
}

Map<ResultCode, Result> results = {
  ResultCode.goodCondition: Result('Good condition', '', [], []),
  ResultCode.abrasiveWear: Result('Abrasive Wear', 'Abrasive wear (keausan abrasive) diketahui merupakan jenis keausan yang sering dijumpai. Keausan abrasive terjadi ketika terdapat partikel-partikel keras yang berukuran lebih besar dari ketebalan film pelumas diantara dua permukaan yang bergerak.', [
    'asset/images/result/Abrasive Wear (1).png', 'asset/images/result/Abrasive Wear (2).png',
  ], []),
  ResultCode.adhesiveWear: Result('Adhesive Wear','Adhesive wear (keausan adhesive) adalah keusan yang paling cepat mengembang. Di dalam adhesive wear, dua permukaan yang bergerak membuat kontak tanpa lubrikasi atau pendingin yang cukup. Permukaan yang bergerak ini menghasilkan friksi, menaikkan temperatur permukaan sampai titik-lebur, dan menyebabkan permukaan menempel satu sama lain.', [
    'asset/images/result/Adhesive Wear (1).png', 'asset/images/result/Adhesive Wear (2).png',
  ], []),
  ResultCode.corrosionWear: Result('Corrosion Wear','Corrosion atau pengaratan adalah kerusakan atau kehancuran material akibat adanya reaksi kimia di sekitar lingkungannya (perubahan kimia pada permukaan metal).', [
    'asset/images/result/Overpressure (1).png', 'asset/images/result/Overpressure (2).png',
  ], []),
  ResultCode.erosionWear: Result('Erosion Wear','Erosi terjadi ketika partikel kecil yang keras yang terdapat di dalam fluida mengalir menghantam komponen yang dilaluinya dengan kecepatan tinggi dan menimbulkan impact (benturan) dan kerusakan yang abrasive. Permukaan yang aus sering memperlihatkan tanda-tanda benturan-banturan partikel kecil atau bintik-bintik kasar.', [
    'asset/images/result/Erosion Wear (1).png', 'asset/images/result/Adhesive (2).png',
  ], []),
  ResultCode.cavitationErosion: Result('Cavitation Erosion','Cavitation erosi terjadi ketika gelembung udara / gelembung uap air pecah pada permukaan metal. Semua cairan berisi larutan gas yang membentuk gelembung udara di area yang bertekanan rendah, dan kondisi-kondisi sistem abnormal dapat memicu munculnya gelembung uap air tambahan. Ketika gelembung ini masuk diarea bertekanan tinggi, mereka meledak yang menghasilkan tekanan cairan dengan kecepatan sangat tinggi. Cracks (retak) yang sangat kecil dan akan semakin banyak sampai serpihan metal terjadi menghasilkan lubang-lubang kecil.', [
    'asset/images/result/Cavitation Erosion (1).png', 'asset/images/result/Cavitation Erosion (2).png',
  ], []),
  ResultCode.contactStressFatigue: Result('Contact Stress Fatigue','Contact stress fatigue terjadi ketika dua permukaan saling bergesekan atau saling menekan terhadap bagian yang lain, menghasilkan tekanan yang tinggi, pergerakan permukaan, dan retak fatigue di salah satu atau kedua permukaan.', [
    'asset/images/result/Contact Stress Fatigue (1).png', 'asset/images/result/Contact Stress Fatigue (2).png', 'asset/images/result/Contact Stress Fatigue (3).png',
  ], []),
  ResultCode.frettingCorrosion: Result('Fretting Corrosion','Fretting Corrosion terjadi bila dua parts yang seharusnya diikat dengan ketat mengalami pergerakan/getaran sehingga membuat masing-masing part saling menekan, mengakibatkan benturan-benturan kecil di permukaan. Pergerakan yang berlanjut menyebabkan potongan potongan kecil terlepas dari masing-masing permukaan. Potongan-potongan kecil ini berkarat dan membentuk oksida coklat kemerah-merahan (butiran karat).', [
    'asset/images/result/Fretting Corrosion (1).png', 'asset/images/result/Fretting Corrosion (2).png',
  ], []),
  ResultCode.brittleFracture: Result('Brittle Fracture','Brittle fracture biasanya merupakan akibat dari kerusakan lain dan tidak dikategorikan / dihubungkan sebagai root cause. Jenis patahan ini terjadi sangat cepat, terlihat  seperti kristal karena patahannya terjadi sepanjang batas butir atau melalui butir tanpamerusak bentuk butiran itu.', [
    'asset/images/result/Brittle Fracture (1).png', 'asset/images/result/Brittle Fracture (2).png',
  ], []),
  ResultCode.ductileFracture: Result('Ductile Fracture','Ductile fracture disebabkan oleh overload dan umumnya memperlihatkan distorsi (perubahan bentuk), bengkok, twisted (terpuntir), necked (terjadi pengecilan penampang) atau jika patahan disatukan maka part tidak kelihatan seperti aslinya', [
    'asset/images/result/Ductile Fracture (1).png', 'asset/images/result/Ductile Fracture (2).png',
  ], []),
  ResultCode.fatigueFracture: Result('Fatigue Fracture','Fatigue fracture sering dihubungkan dengan penyebab utama dari kerusakan. Fatiguefracture dapat ditelusuri untuk mengetahui titik awal kerusakan dengan mencari ratchet mark dan titik dari mana beach mark menyebar.', [
    'asset/images/result/Fatigue Fracture (1).png', 'asset/images/result/Fatigue Fracture (2).png',
  ], []),
  ResultCode.plasticYealding: Result('Electrical Fitting & Fluting','Jenis kerusakan yang disebabkan oleh arus tinggi saat bearing tidak berputar umumnya menyebabkan pancaran bunga matahari, penyebab utama dapat terjadi termasuk pada saat welding pada mesin dengan kabel ground disambungkan seperti cara yang mana arus listrik mengalir melalui bearing. Bentuk lainnya dari kerusakan akibat api listrik adalah aliran lintasan dari arus rendah secara relatif dengan masa waktu yang panjang selama operasi', [
    'asset/images/result/Electrical Fitting & Fluting.png'
  ], []),
  ResultCode.electricalFitting: Result('Plastic Yealding','Plastic yielding terjadi karena suhu tinggi,lapisan oli yang tidak cukup sehingga membolehkan kontak metal dengan metal. Beban yang berat akan mengubah bentuk bearing secara permanen. Jenis kerusakan ini menimbulkan ledging, rippling, pitting, atau spalling.', [
    'asset/images/result/Plastic Yealding (1).png', 'asset/images/result/Plastic Yealding (2).png',
  ], []),
  ResultCode.damageDueInstallation: Result('Kerusakan karena pemasangan dan penanganan','Kesalahan perawatan atau praktek pemasangan dan melepaskan bearing dapat menyebabkan bearing rusak, raceway dapat lecet, retak, atau sompel.', [
    'asset/images/result/Kerusakan karena pemasangan dan penanganan (1).png', 'asset/images/result/Kerusakan karena pemasangan dan penanganan (2).png',
  ], []),
  ResultCode.overheating: Result('Overheating','Overheating merupakah awal dari terjadinya kerusakan adhesive dan erosi kavitasi. Overheating dapat menghasilkan perubahan warna yang umum pada pompa da membakar pada lapisan oli. Perubahan warna abu abu yang lebih gelap adalah karena oli yang overheat menyisakan abu (residue ash). Pada komponen yang terdampak overheating, tidak menunjukkan adanya tanda tanda kerusakan adhesive. Hal ini menunjukkan bahwa cairan hidrolik adalah tersedia tapi telah overheat.', [
    'asset/images/result/Overheating (1).png', 'asset/images/result/Overheating (2).png',
  ], []),
  ResultCode.overpressure: Result('Overpressure','Tanda tanda umum overpressure adalah part retak atau patah seperti casting, cam ring, bolts, dll (tanpa ditemukannya bukti bukti keausan, obverheat, atau kondisi abnormal lainnya). Karena overpressure dapat menekan pressure plates, flex plates, dan barrels lebih kuat menahan part yang berdampingan.', [
    'asset/images/result/Overpressure (1).png', 'asset/images/result/Overpressure (2).png',
  ], []),
  ResultCode.bendingFatigue: Result('Bending Fatigue','Terlihat hanya bagian kecil yang mengalami patah fatigue dan sebagian besar mengalami patah akhir vrittle yang menandakan terjadinya beban tinggi.', [
    'asset/images/result/Bending Fatigue (1).png', 'asset/images/result/Bending Fatigue (2).png',
  ], []),
  ResultCode.reverseBendingFatigue: Result('Reverse Bending Fatigue','Reverse bending fatigue ditandai dengan terlihatnya permukaan patahan yang halus pada bagian kiri dan permukaan yang gelap pada bagian kanan, kasar, dan patahan berupa patahan kayu pada bagian tengah.', [
    'asset/images/result/Reverse Bending Fatigue.png',
  ], []),
  ResultCode.rotatingBendingFatigue: Result('Rotating Bending Fatigue','Permukaan patahan rotating bending fatigue memperlihatkan beberapa daerah awal terjadinya patahan, rachet mark dan beach mark pada sekitar fillet dan terlihat bagian yang mengalami patahan akhir ductile.', [
    'asset/images/result/Rotating Bending Fatigue (1).png', 'asset/images/result/Rotating Bending Fatigue (2).png',
  ], []),
  ResultCode.torsionalFatigue: Result('Torsional Fatigue','Torsional overload merupakan salah satu jenis patahan fatigue yang tetrjadi pada shaft. Jenis patahan ductile torsional yang paling umum adalah: 45 tensile, terpotong membujur, dan terpotong melintang. Retakan akan bermula dari area yang paling lemah (45, longitudinal shear, transverse shear). Jika shaft mengalami beban puntir cyclic yang tinggi, dapat mengakibatkan patahan torsional fatigue.', [
    'asset/images/result/Torsional Fatigue (1).png', 'asset/images/result/Torsional Fatigue (2).png',
  ], []),
};

List<Engine> engines = [
  Engine('Engine Bearing', Code.engineBearing, Category.engine, false, [], {}),
  Engine('Crankshaft', Code.crankshaft, Category.engine, false, [], {}),
  Engine('Connecting Rod', Code.connectionRod, Category.engine, false, [], {}),
  Engine('Piston, Rings & Liner', Code.pistonRingLiner, Category.engine, false, [], {}),
  Engine('Valves', Code.valves, Category.engine, false, [], {}),
  Engine('Turbocharger', Code.turbocharger, Category.engine, false, [], {}),
  Engine('Threaded Fastener', Code.threadedFastener, Category.engine, false, [], {}),
  Engine('Gear', Code.gear, Category.powertrain, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], 30, 30), // Q2 1
    Question("Apakah ada partikel partikel kontaminan di sekitar gear?", [
      'asset/images/gear/A1.png',
    ], 3, 10), // A1 2
    Question("Apakah terdapat goresan halus dan kilapan pada gigi gear seperti pada gambar?", [
      'asset/images/gear/A2 (1).png',
      'asset/images/gear/A2 (2).png',
    ], 4, 4), // A2 3
    Question("Apakah ada goresan besar, potongan, atau luka memar pada gigi gear?", [
    ], 5, 10), // A3 4
    Question("Apakah terlihat pitting halus pada tip gear?", [
      'asset/images/gear/A4.png',
    ], 6, 6,), // A4 5
    Question("Apakah terlihat goresan pada addendum gear?", [
      'asset/images/gear/A5.png',
    ], 7, 7), // A5 6
    Question("Apakah ada kerusakan pada pitch line?", [
      'asset/images/gear/A6.png',
    ], 8, 8), // A6 7
    Question("Apakah terdapat kerusakan dan partikel kontaminan disekitar gear?", [
      'asset/images/gear/A7.png',
    ], -1, -1), // A7 8
    Question("Apakah terjadi kerusakan initial scoring pada komponen seperti pada gambar?", [
      'asset/images/gear/B1.png',
    ], 10, 15), // B1 9
    Question("Apakah terdapat goresan hitam pada addendum gear?", [
      'asset/images/gear/B2.png',
    ], 11, 15), // B2 10
    Question("Apakah ada coakan pada bagian pitch line?", [
      'asset/images/gear/B3.png',
    ], 12, 12), // B3 11
    Question("Apakah gigi gear menipis dan menghitam?", [
      'asset/images/gear/B4.png',
    ], 13, 13), // B4 12
    Question("Apakah gigi gear menunjukan bekas lelehan?", [
      'asset/images/gear/B5.png',
    ], 14, 14), // B5 13
    Question("Apakah terdapat retak, pitting, atau rusak yang disebabkan misalignment?", [
      'asset/images/gear/B6.png',
    ], -1, -1), // B6 14
    Question("Apakah ada perubahan warna atau karat pada gear?", [
      'asset/images/gear/C1 (1).png',
      'asset/images/gear/C1 (2).png',
    ], 16, 18), // C1 15
    Question("Apakah gigi gear mengalami pitting (lubang lubang kecil)?", [
      'asset/images/gear/C2 (1).png',
      'asset/images/gear/C2 (2).png',
    ], 17, 17), // C2 16
    Question("Apakah warna pelumas menunjukan adanya kontaminasi?", [
    ], -1, 18), // C3 17
    Question("Apakah terdapat rippling seperti pada gambar?", [
      'asset/images/gear/D1.png',
    ], 19, 20), // D1 18
    Question("Apakah terdapat ledging pada gigi gear?", [
      'asset/images/gear/D2.png',
    ], -1, 20), // D2 19
    Question("Apakah ada pitting dengan bentuk v pada gigi gear yang bagus?", [
      'asset/images/gear/E1.png',
    ], 21, -1), // E1 20
    Question("Apakah terdapat moderate pitting?", [
      'asset/images/gear/E2.png',
    ], 22, 22), // E2 21
    Question("Apakah ada retakan berbentuk v pada gear?", [
      'asset/images/gear/E3.png',
    ], 23, 23), // E3 22
    Question("Apakah gear mengalami beban sliding dan mengalami pitting yang meluas?", [
      'asset/images/gear/E4.png',
    ], 24, -1), // E4 23
    Question("Apakah ada keberisikan saat gear dioperasikan dan muncul kerusakan seperti pada gambar saat pengecekan?", [
      'asset/images/gear/E5.png',
    ], 25, 25), // E5 24
    Question("Apakah ada spalling (congkelan) pada satu sisi gigi gear?", [
      'asset/images/gear/E6.png',
    ], 26, 26), // E6 25
    Question("Apakah case crushing ditemukan pada gigi gear?", [
      'asset/images/gear/E7.png',
    ], 27, 27), // E7 26
    Question("Apakah terjadi polishing parah pada bagian heel dan pitting diatas tooth root radius?", [
      'asset/images/gear/E8.png',
    ], 28, 28), // E8 27
    Question("Apakah terdapat fatigue crack pada gigi gear?", [
      'asset/images/gear/E9.png',
    ], -1, -1), // E9 28
    Question("Apakah terdapat beachmark dan rachet mark pada patahan?", [
      'asset/images/gear/F1.png',
    ], 30, 33), // F1 29
    Question("Apakah ada fracture pada fillet radius?", [
      'asset/images/gear/F2.png',
    ], 31, 31), // F2 30
    Question("Apakah ada impact damage dan chipping pada pinggiran gear?", [
      'asset/images/gear/F3.png',
    ], 32, 33), // F3 31
    Question("Apakah terjadi hardline contact pada gigi gear?", [
      'asset/images/gear/F4.png',
    ], -1, -1), // F4 32
    Question("Apakah permukaan patahan berbentuk seperti kayu?", [
      'asset/images/gear/G1.png',
    ], 36, 34), // G1 33
    Question("Apakah terdapat shear lip pada ujung patahan?", [
      'asset/images/gear/G2.png',
    ], 35, -1), // G2 34
    Question("Jika disatukan, apakah patahan tidak terlihat seperti aslinya?", [
    ], -1, -1), // G3 35
    Question("Apakah terdapat chevron (seperti insang)?", [
      'asset/images/gear/H1.png',
    ], 37, 37), // H1 36
    Question("Apakah permukaan patahan terdapat butiran kristal?", [
      'asset/images/gear/H2 (1).png',
      'asset/images/gear/H2 (2).png',
    ], 38, 34), // H2 37
    Question("Apakah terdapat banyak chevron (garis garis yang membentuk v yang terpusat pada crack initiation site) seperti ini?", [
      'asset/images/gear/H3.png',
    ], -1, -1), // H3 38
  ], {
    '[false, false]': results[ResultCode.goodCondition],
    '[false, false, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kerusakan pada seal', 'Kerusakan pada filter']),
    '[false, false, false, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Tanpa adanya lubrikasi yang memadai', 'Beban berlebih', 'Misalignment', 'Rpm yang terlalu tinggi']),
    '[false, false, false, false, false]': results[ResultCode.corrosionWear]?.copyWith(causes: ['Kemungkinan adanya kontaminasu pelumas dengan uap air']),
    '[false, false, false, false, false, false]': results[ResultCode.plasticYealding]?.copyWith(causes: ['Beban berlebih', 'Permukaan lunak', 'Kurangnya lubrikasi']),
    '[false, false, false, false, false, false, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Beban atau putaran berlebih', 'Kelurusan tidak tepat', 'Salah backlash', 'Service terlambat', 'Lubrikasi salah', 'Suhu tinggi', 'Salah ukuran']),
    '[false, false, false, false, false, false, false, false]': results[ResultCode.fatigueFracture]?.copyWith(causes: ['Overloading', 'Bending pada gear', 'Beban kejut']),
    '[false, false, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Beban kejut', 'Overloading']),
    '[false, false, true, false]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Beban kejut', 'Overloading']),
  }),
  Engine('Shaft', Code.shaft, Category.powertrain, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], 7, -1), // Q2 1
    Question("Apakah terdapat goresan atau alur alur halus/dalam pada permukaan shaft?", [
      'asset/images/shaft/A1.png',
    ], 3, 4), // A1 2
    Question("Apakah terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di permukaan yang mengalami keausan atau di sekitar komponen yang mengalami keausan?", [
      'asset/images/shaft/A2.png',
    ], -1, -1), // A2 3
    Question("Apakah shaft mengalami discoloration?", [
      'asset/images/shaft/B1.png',
    ], -1, 5), // B1 4
    Question("Apakah pada permukaan shaft mengalami oksidasi dan terjadi perubahan warna (coklat ke merah merahan)?", [
      'asset/images/shaft/C1 (1).png', 'asset/images/shaft/C1 (2).png',
    ], -1, 6), // C1 5
    Question("Apakah pada permukaan shaft ada yang terkelupas (spalling)?", [
      'asset/images/shaft/D1.png',
    ], -1, -1), // D1 6
    Question("Apakah terdapat chevron pada permukaan patahan?", [
      'asset/images/shaft/E1 (1).png', 'asset/images/shaft/E1 (2).png',
    ], 8, 10), // E1 7
    Question("Apakah shaft mengalami bending (bengkok) atau buckling (tertekuk)?", [
      'asset/images/shaft/E2 (1).png', 'asset/images/shaft/E2 (2).png',
    ], 9, 9), // E2 8
    Question("Apakah permukaan patahan terlihat terang dan mengkilap?", [
      'asset/images/shaft/E3.png',
    ], -1, -1), // E3 9
    Question("Apakah permukaan patahan terlihat seperti kayu?", [
      'asset/images/shaft/F1.png',
    ], 11, 11), // F1 10
    Question("Apakah permukaan patahan berbentuk memanjang dan melintang?", [
      'asset/images/shaft/F2 (1).png', 'asset/images/shaft/F2 (2).png',
    ], 12, 12), // F2 11
    Question("Apakah permukaan patahan halus seperti sutra?", [
      'asset/images/shaft/F3.png',
    ], -1, 13), // F3 12
    Question("Apakah terdapat rachet mark dan beach mark pada permukaan patahan?", [
      'asset/images/shaft/G1 (1).png', 'asset/images/shaft/G1 (2).png', 'asset/images/shaft/G1 (3).png',
    ], 14, -1), // G1 13
    Question("Apakah terdapat korosi pada permukaan patahan?", [
      'asset/images/shaft/G2 (1).png', 'asset/images/shaft/G2 (2).png',
    ], -1, 15), // G2 14
    Question("Apakah terdapat beach mark dan rachet mark?", [
      'asset/images/shaft/H1.png',
    ], 16, -1), // H1 15
    Question("Apakah pada permukaan patahan terdapat perbedaan struktur/warna? (permukaan yang halus di bagian kiri, dan gelap pada bagian kanan)?", [
      'asset/images/shaft/H2.png',
    ], 17, 20), // H2 16
    Question("Apakah permukaan patahan kasar?", [
      'asset/images/shaft/H3.png',
    ], 18, 18), // H3 17
    Question("Apakah permukaan patahan memiliki bentuk visual seperti patahan pada kayu?", [
      'asset/images/shaft/H4.png',
    ], -1, -1), // H4 18
    Question("Apakah terdapat beach mark atau rachet mark?", [
      'asset/images/shaft/I1.png',
    ], -1, -1), // I1 19
    Question("Apakah terdapat beach mark dan rachet mark?", [
      'asset/images/shaft/J1 (1).png', 'asset/images/shaft/J1 (2).png',
    ], 21, -1), // J1 20
    Question("Apakah retakan bercabang pada sudut 45 yang berlawanan dengan titik dimana beban tensile terjadi?", [
      'asset/images/shaft/J2 (1).png', 'asset/images/shaft/J2 (2).png',
    ], 22, 19), // J2 21
    Question("Apakah permukaan patahan halus dan seperti sutra?", [
      'asset/images/shaft/J3.png',
    ], 23, 23), // J3 22
    Question("Apakah permukaan patahan membentuk ”monkey face” (seperti pada gambar)?", [
      'asset/images/shaft/J4.png',
    ], 24, 24), // J4 23
    Question("Apakah permukaan patahan membentuk “starry fracture” (seperti pada gambar)?", [
      'asset/images/shaft/J5.png',
    ], 25, 25), // J5 24
    Question("Apakah terdapat deformasi puntiran pada komponen?", [
      'asset/images/shaft/J6 (1).png', 'asset/images/shaft/J6 (2).png',
    ], -1, -1), // J6 25
  ], {
    '[false, false]': results[ResultCode.goodCondition],
    '[true, false, false, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, false, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, false, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, false, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, false, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, false, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, false, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, true, false, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, false, false, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, true, false, false, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, true, false, true, false, true, false, true, false, false]': results[ResultCode.goodCondition],
    '[true, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan pada saat proses assemble', 'Kontaminan dari seal yang rusak', 'Partikel akibat retak pada housing/hose', 'Pengisial oli yang terkontaminasi']),
    '[true, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan pada saat proses assemble', 'Kontaminan dari seal yang rusak', 'Partikel akibat retak pada housing/hose', 'Pengisial oli yang terkontaminasi']),
    '[true, false, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kurangnya lubrikasi', 'Penyempitan pada bagian rongga dalam']),
    '[true, false, false, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Permukaan yang dipasang/digabung dengan ketat dipaksa bergoyang/bergetar (pergerakan kecil bisa menyebabkan fretting corrosion)']),
    '[true, false, false, false, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Lapisan oli yang terlalu tipis', 'Beban terlalu tinggi dipermukaan rolling']),
    '[false, true, true, true, true]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Bending overload', 'Compression overload', 'Torsional overload']),
    '[false, true, true, false, false]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Bending overload', 'Compression overload', 'Torsional overload']),
    '[false, true, true, true, false]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Bending overload', 'Compression overload', 'Torsional overload']),
    '[false, true, true, false, true]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Bending overload', 'Compression overload', 'Torsional overload']),
    '[false, true, false, true, true, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Torsional overload', 'Longitudinal shear', 'Transverse shear']),
    '[false, true, false, false, false, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Torsional overload', 'Longitudinal shear', 'Transverse shear']),
    '[false, true, false, true, false, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Torsional overload', 'Longitudinal shear', 'Transverse shear']),
    '[false, true, false, false, true, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Torsional overload', 'Longitudinal shear', 'Transverse shear']),
    '[false, true, false, true, true, false, true, true]': results[ResultCode.bendingFatigue]?.copyWith(causes: ['High cyclic load', 'Gear misalignment', 'Corrosive environment']),
    '[false, true, false, false, false, false, true, true]': results[ResultCode.bendingFatigue]?.copyWith(causes: ['High cyclic load', 'Gear misalignment', 'Corrosive environment']),
    '[false, true, false, true, false, false, true, true]': results[ResultCode.bendingFatigue]?.copyWith(causes: ['High cyclic load', 'Gear misalignment', 'Corrosive environment']),
    '[false, true, false, false, true, false, true, true]': results[ResultCode.bendingFatigue]?.copyWith(causes: ['High cyclic load', 'Gear misalignment', 'Corrosive environment']),
    '[false, true, false, true, true, false, true, false, true, true, true, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, false, false, true, false, true, true, true, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, false, false, true, false, true, true, true, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, true, false, true, false, true, true, true, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, true, false, true, false, true, true, false, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, false, false, true, false, true, true, false, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, false, false, true, false, true, true, false, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, true, false, true, false, true, true, false, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, true, false, true, false, true, true, true, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, false, false, true, false, true, true, true, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, false, false, true, false, true, true, true, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, true, false, true, false, true, true, true, false]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, true, false, true, false, true, true, false, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, false, false, true, false, true, true, false, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, false, false, true, false, true, true, false, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, false, true, false, true, false, true, true, false, true]': results[ResultCode.reverseBendingFatigue]?.copyWith(causes: ['High cyclic load']),
    '[false, true, false, true, true, false, true, false, true, false, true, false, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Rotating bending load yang tinggi']),
    '[false, true, false, false, false, false, true, false, true, false, true, false, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Rotating bending load yang tinggi']),
    '[false, true, false, true, false, false, true, false, true, false, true, false, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Rotating bending load yang tinggi']),
    '[false, true, false, false, true, false, true, false, true, false, true, false, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Rotating bending load yang tinggi']),
    // TODO: 44 of 64 Torsional Fatigue conditions
    '[false, true, false, true, true, false, true, false, true, false, true, true, true, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, false, false, true, false, true, false, true, true, true, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, false, false, true, false, true, false, true, true, true, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, true, false, true, false, true, false, true, true, true, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, true, false, true, false, true, false, true, true, false, false, false, false]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, false, false, true, false, true, false, true, true, false, false, false, false]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, false, false, true, false, true, false, true, true, false, false, false, false]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, true, false, true, false, true, false, true, true, false, false, false, false]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, true, false, true, false, true, false, true, true, false, false, false, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, false, false, true, false, true, false, true, true, false, false, false, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, false, false, true, false, true, false, true, true, false, false, false, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, true, false, true, false, true, false, true, true, false, false, false, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, true, false, true, false, true, false, true, true, false, false, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, false, false, true, false, true, false, true, true, false, false, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, false, false, true, false, true, false, true, true, false, false, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, true, false, true, false, true, false, true, true, false, false, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, true, false, true, false, true, false, true, true, false, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, false, false, true, false, true, false, true, true, false, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, true, false, false, true, false, true, false, true, true, false, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
    '[false, true, false, false, true, false, true, false, true, false, true, true, false, true, true, true]': results[ResultCode.torsionalFatigue]?.copyWith(causes: ['Torsional cyclic overload', 'Cyclic reverse overload']),
  }),
  Engine('Bearing', Code.bearing, Category.powertrain, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], 27, -1), // Q2 1
    Question("Apakah terdapat pola spall (terkelupas, cungkilan) yang merata pada roller atau cage  bearing?", [
      'asset/images/anti_friction_bearing/A1.png',
    ], 3, 7), // A1 2
    Question("Apakah terdapat pola spall (terkelupas, cungkilan) yang merata pada permukaan bearing yang tidak berputar seperti pada gambar?", [
      'asset/images/anti_friction_bearing/A2.png',
    ], 4, 4), // A2 3
    Question("Apakah teradapat garis pada permukaan bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/A3.png',
    ], 5, 5), // A3 4
    Question("Apakah terdapat pola keausan seperti pada gambar?", [
      'asset/images/anti_friction_bearing/A4.png',
    ], 6, 6), // A4 5
    Question("Apakah terdapat retakan atau spalling pada permukaan bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/A5.png',
    ], -1, -1), // A5 6
    Question("Apakah terjadi perubahan bentuk permanen pada bearing?", [
      'asset/images/anti_friction_bearing/B1 (1).png',
      'asset/images/anti_friction_bearing/B1 (2).png',
      'asset/images/anti_friction_bearing/B1 (3).png',
      'asset/images/anti_friction_bearing/B1 (4).png',
    ], 8, 10), // B1 7
    Question("Apakah terjadi perubahan warna (discoloration) pada bearing?", [
      'asset/images/anti_friction_bearing/B2 (1).png',
      'asset/images/anti_friction_bearing/B2 (2).png',
    ], 9, 9), // B2 8
    Question("Apakah terdapat lecet (brushing) pada permukaan bearing?", [
      'asset/images/anti_friction_bearing/B3.png',
    ], -1, -1), // B3 9
    Question("Apakah terjadi perubahan warna (discoloration) pada bearing?", [
      'asset/images/anti_friction_bearing/C1 (1).png',
      'asset/images/anti_friction_bearing/C1 (2).png',
    ], 11, 12), // C1 10
    Question("Apakah terjadi perubahan bentuk pada bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/C2.png',
    ], -1, -1), // C2 11
    Question("Apakah terdapat pitting pada permukaan bearing?", [
      'asset/images/anti_friction_bearing/D1.png',
    ], 13, 15), // D1 12
    Question("Apakah terdapat scratch (goresan) di permukaan yang mengalami keausan?", [
      'asset/images/anti_friction_bearing/D2.png',
    ], 14, 20), // D2 13
    Question("Apakah terdapat partikel abrasive (pasir, serpihan aluminium, kotoran, atau material asing lainnya) di permukaan yang mengalami keausan atau di sekitar komponen yang mengalami keausan?", [
      'asset/images/anti_friction_bearing/D3.png',
    ], -1, -1), // D3 14
    Question("Apakah terdapat karat pada bearing?", [
      'asset/images/anti_friction_bearing/E1.png',
    ], 16, 20), // E1 15
    Question("Apakah permukaan mengalami perubahan seperti pada gambar?", [
      'asset/images/anti_friction_bearing/E2.png',
    ], -1, 17), // E2 16
    Question("Apakah terdapat karatan fretting pada bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/F1.png',
    ], 18, -1), // F1 17
    Question("Apakah permukaan terlihat halus dan mengkilap pada permukaan bearing?", [
      'asset/images/anti_friction_bearing/F2.png',
    ], 19, 19), // F2 18
    Question("Apakah terjadi keausan pada housing atau shaft tempat bearing berputar?", [
    ], 20, 20), // F3 19
    Question("Apakah terdapat lecet (false brinelling) pada permukaan bearing?", [
      'asset/images/anti_friction_bearing/F4.png',
    ], -1, -1), // F4 20
    Question("Apakah terdapat pitting pada bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/G1.png',
    ], -1, 22), // G1 21
    Question("Apakah terdapat lubang kecil yang menyerupai roller seperti pada gambar?", [
      'asset/images/anti_friction_bearing/G2.png',
    ], -1, 23), // G2 22
    Question("Apakah bagian bearing ada terdapat kerusakan akibat terbentur seperti pada gambar?", [
      'asset/images/anti_friction_bearing/H1 (1).png',
      'asset/images/anti_friction_bearing/H1 (2).png',
    ], 24, 24), // H1 23
    Question("Apakah terdapat kerusakan karna salah prosedur pemasangan pada bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/H2 (1).png',
      'asset/images/anti_friction_bearing/H2 (2).png',
    ], 25, 25), // H2 24
    Question("Apakah terdapat kerusakan karena salah prosedur pelepasan pada bearing seperti gambar?", [
      'asset/images/anti_friction_bearing/H3 (1).png',
      'asset/images/anti_friction_bearing/H3 (2).png',
    ], -1, -1), // H3 25
    Question("Apakah terdapat pecahan pada bearing seperti pada gambar?", [
      'asset/images/anti_friction_bearing/I1.png',
    ], 27, 29), // I1 26
    Question("Apakah permukaan patahan terlihat kasar seperti kayu?", [
      'asset/images/anti_friction_bearing/I2.png',
    ], -1, -1), // I2 27
    Question("Apakah terlihat beach mark dan rachet mark pada permukaan patahan?", [
      'asset/images/anti_friction_bearing/J1.png',
    ], -1, 26), // J1 28
    Question("Apakah permukaan patahan terdapat butiran kristal?", [
      'asset/images/anti_friction_bearing/K1.png',
    ], 30, -1), // K1 29
    Question("Apakah terdapat banyak chevron (garis garis kasar pada permukaan patahan)?", [
      'asset/images/anti_friction_bearing/K2.png',
    ], -1, -1), // K2 30
  ], {
    '[false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false, false]': results[ResultCode.goodCondition],
    '[true, false, false, false, false, false, false, false, false, false, false]': results[ResultCode.goodCondition],
    '[true, false, false, false, true, false, false, false, false, false, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, true, true, true, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, false, true, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, false, true, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, true, true, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, true, false, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, false, false, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, false, false, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, true, false, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, true, false, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, false, false, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, false, false, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, true, false, true]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, true, true, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, false, true, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, true, false, true, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, true, false, true, true, false]': results[ResultCode.contactStressFatigue]?.copyWith(causes: ['Penerapan beban terlalu berlebihan', 'Setelan pemasangan terlalu ketat', 'Setelan pemasangan terlalu longgar', 'Shaft terlalu besar atau housing terlalu kecil', 'Tidak lurus/sejajar (misalignment)', 'Viskositas pelumasan rendah']),
    '[true, false, true, true, true]': results[ResultCode.plasticYealding]?.copyWith(causes: ['Penggunaan oli dengan viskositas terlalu rendah', 'Temperature kerja tinggi (suhu udara luar sangat tinggi)', 'Jumlah oli sangat sedikit', 'Terlalu banyak oli atau grease menyebabkan teraduk-aduk (churning)', 'beban tinggi', 'Salah aplikasi', 'Misalignment', 'Misadjustment', 'Pengepasan dimensi yang salah']),
    '[true, false, true, false, false]': results[ResultCode.plasticYealding]?.copyWith(causes: ['Penggunaan oli dengan viskositas terlalu rendah', 'Temperature kerja tinggi (suhu udara luar sangat tinggi)', 'Jumlah oli sangat sedikit', 'Terlalu banyak oli atau grease menyebabkan teraduk-aduk (churning)', 'beban tinggi', 'Salah aplikasi', 'Misalignment', 'Misadjustment', 'Pengepasan dimensi yang salah']),
    '[true, false, true, true, false]': results[ResultCode.plasticYealding]?.copyWith(causes: ['Penggunaan oli dengan viskositas terlalu rendah', 'Temperature kerja tinggi (suhu udara luar sangat tinggi)', 'Jumlah oli sangat sedikit', 'Terlalu banyak oli atau grease menyebabkan teraduk-aduk (churning)', 'beban tinggi', 'Salah aplikasi', 'Misalignment', 'Misadjustment', 'Pengepasan dimensi yang salah']),
    '[true, false, true, false, true]': results[ResultCode.plasticYealding]?.copyWith(causes: ['Penggunaan oli dengan viskositas terlalu rendah', 'Temperature kerja tinggi (suhu udara luar sangat tinggi)', 'Jumlah oli sangat sedikit', 'Terlalu banyak oli atau grease menyebabkan teraduk-aduk (churning)', 'beban tinggi', 'Salah aplikasi', 'Misalignment', 'Misadjustment', 'Pengepasan dimensi yang salah']),
    '[true, false, false, true, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan supply oli', 'Cage aus berlebihan atau pecah', 'Temperature kerja tinggi']),
    '[true, false, false, true, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan supply oli', 'Cage aus berlebihan atau pecah', 'Temperature kerja tinggi']),
    '[true, false, false, false, true, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dalam oli']),
    '[true, false, false, false, true, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dalam oli']),
    '[true, false, false, false, false, true, true]': results[ResultCode.corrosionWear]?.copyWith(causes: ['Bearing tidak dilindungi (dengan oli, grease atau pelindung lainnya) setelah pembongkaran dilakukan', 'Bearing tidak disimpan ditempat yang kering', 'Embun masuk dalam sistem pelumasan']),
    '[true, false, false, false, true, false, false, true, true]': results[ResultCode.corrosionWear]?.copyWith(causes: ['Bearing tidak dilindungi (dengan oli, grease atau pelindung lainnya) setelah pembongkaran dilakukan', 'Bearing tidak disimpan ditempat yang kering', 'Embun masuk dalam sistem pelumasan']),
    '[true, false, false, false, true, false, false, true, false, false]': results[ResultCode.corrosionWear]?.copyWith(causes: ['Bearing tidak dilindungi (dengan oli, grease atau pelindung lainnya) setelah pembongkaran dilakukan', 'Bearing tidak disimpan ditempat yang kering', 'Embun masuk dalam sistem pelumasan']),
    '[true, false, false, false, true, false, false, true, false, true, true, true, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, true, true, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, true, false, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, false, false, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, false, false, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, false, true, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, true, false, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, false, true, false, true, false, true, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, true, true, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, true, true, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, true, false, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, false, false, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, false, false, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, false, true, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, true, false, true]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, false, true, false, true, false, true, false]': results[ResultCode.frettingCorrosion]?.copyWith(causes: ['Shaft terlalu kecil', 'Housing bore terlalu besar', 'Material asing tersangkut diantara roller dan raceway', 'Beban thrust terlalu besar']),
    '[true, false, false, false, true, false, true, true]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, true, false, true, false]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, false, false, true]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, false, false, false, true]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, true, false, false, false, true]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, true, false, false, false, false, true]': results[ResultCode.electricalFitting]?.copyWith(causes: ['Arus tinggi yang terjadi sementara bearing tidak berputar (umumnya menyebabkan pancaran bunga matahari)', 'Arus rendah yang terjadi pada masa waktu yang panjang sementara bearing sedang berputar']),
    '[true, false, false, false, true, false, false, false, false, false, true, true, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, true, true, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, true, false, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, true, false, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, false, true, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, false, true, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, true, false, false, false, false, false, false, false, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, true, true, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, true, true, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, true, false, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, true, false, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, false, true, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, false, true, false]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[true, false, false, false, false, false, false, false, false, false, true]': results[ResultCode.damageDueInstallation]?.copyWith(causes: ['Salah dalam prosedur pemasangan dan pelepasan']),
    '[false, true, false, true, true]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Beban kejut/overload', 'Misalignment']),
    '[false, true, false, true, false]': results[ResultCode.ductileFracture]?.copyWith(causes: ['Beban kejut/overload', 'Misalignment']),
    '[false, true, true]': results[ResultCode.fatigueFracture]?.copyWith(causes: ['Cyclic overload']),
    '[false, true, false, false, true, true]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Beban kejut/overload', 'Misalignment']),
    '[false, true, false, false, true, false]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Beban kejut/overload', 'Misalignment']),
  }),
  Engine('Gear Pump', Code.gearPump, Category.hydraulic, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], -1, -1), // Q2 1
    Question("Apakah terdapat alur alur / goresan pada komponen gear pump (pump housing, shaft)?", [
      'asset/images/gear_pump/A1_1.png', 'asset/images/gear_pump/A1_2.png',
    ], 3, 6), // A1 2
    Question("Apakah terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di permukaan yang mengalami keausan atau di sekitar komponen yang mengalami keausan?", [
      'asset/images/gear_pump/A2_1.png', 'asset/images/gear_pump/A2_2.png',
    ], 4, 4), // A2 3
    Question("Apakah permukaan yang mengalami keausan terlihat mengkilap?", [
      'asset/images/gear_pump/A3.png',
    ], 5, 6), // A3 4
    Question("Jika terdapat goresan tebal, apakah terjadi perubahan warna menjadi abu abu?", [
      'asset/images/gear_pump/A4.png',
    ], -1, -1), // A4 5
    Question("Apakah komponen yang terdampak mengalami perubahan warna menjadi gelap dan terdapat sisa abu pada komponen? (tidak ditemukan bekas gesekan, seals meleleh)", [
      'asset/images/gear_pump/B1_1.png', 'asset/images/gear_pump/B1_2.png',
    ], -1, 7), // B1 6
    Question("Apakah terdapat bagian yang retak pada komponen pump? (tidak ditemukan keausan, atau abnormal condition lainnya)", [
      'asset/images/gear_pump/C1.png',
    ], -1, -1), // C1 7
  ], {
    '[false, true]': Result('Patah', 'Patahan pada gear pump sangat jarang terjadi, apabila terdapat patahan pada gear pump, patahan tersebut tergolong patahan brittle, ductile, ataupun patahan fatigue.', [], []),
    '[false, false]': results[ResultCode.goodCondition],
    '[true, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, true, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, false, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, true, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, true, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, false, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, false, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, false, true]': results[ResultCode.overheating]?.copyWith(causes: ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, true, true, false, true]': results[ResultCode.overheating]?.copyWith(causes: ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, true, false, false, true]': results[ResultCode.overheating]?.copyWith(causes: ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, false, false, true]': results[ResultCode.overpressure]?.copyWith(causes: ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
    '[true, true, true, false, false, true]': results[ResultCode.overpressure]?.copyWith(causes: ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
    '[true, true, false, false, false, true]': results[ResultCode.overpressure]?.copyWith(causes: ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
  }),
  Engine('Vane Pump', Code.vanePump, Category.hydraulic, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], 14, -1), // Q2 1
    Question("Apakah terdapat goresan pada permukaan komponen yang mengalami keausan?", [
      'asset/images/vane_pump/A1 (1).png', 'asset/images/vane_pump/A1 (2).png','asset/images/vane_pump/A1 (3).png',
    ], 3, 5), // A1 2
    Question("Apakah permukaan keausan terlihat lebih mengkilap?", [
      'asset/images/vane_pump/A2 (1).png', 'asset/images/vane_pump/A2 (2).png'
    ], 4, 4), // A2 3
    Question("Apakah terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di permukaan yang mengalami keausan atau disekitar permukaan yang mengalami keausan?", [
      'asset/images/vane_pump/A3.png',
    ], -1, -1), // A3 4
    Question("Apakah terdapat cungkilan kecil di permukaan komponen (dibagian tertentu)?", [
      'asset/images/vane_pump/B1 (1).png', 'asset/images/vane_pump/B1 (2).png',
    ], 6, 7), // B1 5
    Question("Apakah terdapat pitting (lubang lubang kecil) pada permukaan?", [
      'asset/images/vane_pump/B2.png',
    ], -1, -1), // B2 6
    Question("Apakah terdapat perubahan warna/discoloration (gelap) pada permukaan keausan dan sedikit pengikisan?", [
      'asset/images/vane_pump/C1 (1).png', 'asset/images/vane_pump/C1 (2).png',
    ], 8, 11), // C1 7
    Question("Apakah terdapat sisi material yang terkikis?", [
      'asset/images/vane_pump/C2.png',
    ], 9, 9), // C2 8
    Question("Apakah terdapat bekas lelehan seal?", [
      'asset/images/vane_pump/C3.png',
    ], 10, 10), // C3 9
    Question("Apakah terdapat sisa abu akibat adhesive?", [
      'asset/images/vane_pump/C4.png',
    ], -1, -1), // C4 10
    Question("Apakah komponen yang terdampak mengalami perubahan warna menjadi gelap dan terdapat sisa abu pada komponen? (tidak ditemukan bekas gesekan, seals meleleh)", [
      'asset/images/vane_pump/D1 (1).png', 'asset/images/vane_pump/D1 (2).png',
    ], -1, 12), // D1 11
    Question("Apakah terdapat keretakan pada beberapa lokasi pada komponen khususnya cam ring? (tanpa adanya overheating, tidak ditemukan keausan)", [
      'asset/images/vane_pump/E1.png',
    ], 13, -1), // E1 12
    Question("Apakah keretakan terjadi pada bagian high pressure?", [
      'asset/images/vane_pump/E2.png',
    ], -1, -1), // E2 13
    Question("Pada permukaan patahan, apakah terdapat beach mark yang berhadapan dengan final fracture?", [
      'asset/images/vane_pump/F1 (1).png', 'asset/images/vane_pump/F1 (2).png',
    ], -1, -1), // F1 14
  ], {
    '[false, false]': results[ResultCode.goodCondition],
    '[false, true, false]': results[ResultCode.goodCondition],
    '[true, false, false, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat kontaminan abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di dalam sistem']),
    '[true, true, false, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat kontaminan abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di dalam sistem']),
    '[true, true, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat kontaminan abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di dalam sistem']),
    '[true, true, false, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat kontaminan abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di dalam sistem']),
    '[true, false, true, true]': results[ResultCode.cavitationErosion]?.copyWith(causes: ['Udara yang terjebak di dalam oli', 'Kebocoran sistem udara', 'Low fluid levels', 'Overheating', 'Inadequate oil supply', 'Inlet restriction', 'Kevakuman didalam sistem']),
    '[true, false, true, false]': results[ResultCode.cavitationErosion]?.copyWith(causes: ['Udara yang terjebak di dalam oli', 'Kebocoran sistem udara', 'Low fluid levels', 'Overheating', 'Inadequate oil supply', 'Inlet restriction', 'Kevakuman didalam sistem']),
    '[true, false, false, true, true, true, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, false, false, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, true, false, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, true, true, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, false, true, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, false, false, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, true, false, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, true, false, true, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kekurangan lubrikasi untuk pelumasan', 'Kekurangan lubrikasi untuk pendinginan', 'Oli yang overheat']),
    '[true, false, false, false, true]': results[ResultCode.overheating]?.copyWith(causes: ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, false, false, false, false, true, true]': results[ResultCode.overpressure]?.copyWith(causes: ['Thermal fatigue', 'Overpressure']),
    '[true, false, false, false, false, true, false]': results[ResultCode.overpressure]?.copyWith(causes: ['Thermal fatigue', 'Overpressure']),
    '[false, true, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Cyclic bending overload']),
  }),
  Engine('Piston Pump & Motor', Code.pistonPumpMotor, Category.hydraulic, true, [
    Question("Apakah komponen mengalami keausan?", [], 2, 1), // Q1 0
    Question("Apakah komponen mengalami patah?", [], 9, -1), // Q2 1
    Question("Apakah terdapat goresan pada permukaan komponen?", [
      'asset/images/piston_pump_motor/A1 (1).png', 'asset/images/piston_pump_motor/A1 (2).png',
    ], 3, 5), // A1 2
    Question("Apakah terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) di permukaan yang mengalami keausan atau di sekitarnya?", [
      'asset/images/piston_pump_motor/A2.png'
    ], 4, 4), // A2 3
    Question("Apakah ditemukan partikel abrasive yang tertempel pada permukaan komponen?", [
      'asset/images/piston_pump_motor/A3.png'
    ], -1, -1), // A3 4
    Question("Apakah terdapat bekas sapuan/gesekan metal?", [
      'asset/images/piston_pump_motor/B1.png'
    ], 6, 7), // B1 5
    Question("Apakah terdapat pengikisan yang membujur pada permukaan keausan?", [
      'asset/images/piston_pump_motor/B2.png'
    ], -1, -1), // B2 6
    Question("Apakah ditemukan residue ash (sisa abu) pada permukaan komponen? (tanpa adanya keausan adhesive, lelehan)", [
      'asset/images/piston_pump_motor/C1 (1).png', 'asset/images/piston_pump_motor/C1 (2).png',
    ], -1, 8), // C1 7
    Question("Apakah ditemukan retakan pada beberapa lokasi pompa?", [
      'asset/images/piston_pump_motor/D1.png'
    ], -1, -1), // D1 8
    Question("Apakah terlihat chevron (seperti pada gambar) pada permukaan patahan?", [
      'asset/images/piston_pump_motor/E1.png'
    ], -1, 10), // E1 9
    Question("Apakah terlihat adanya beach mark?", [
      'asset/images/piston_pump_motor/F1.png'
    ], -1, -1), // F1 10
  ], {
    '[false, false]': results[ResultCode.goodCondition],
    '[false, true, false, false]': results[ResultCode.goodCondition],
    '[true, false, false, false, false]': results[ResultCode.goodCondition],
    '[true, true, true, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) didalam sistem']),
    '[true, true, false, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) didalam sistem']),
    '[true, true, true, false]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) didalam sistem']),
    '[true, true, false, true]': results[ResultCode.abrasiveWear]?.copyWith(causes: ['Terdapat partikel abrasive (pasir, serpihan aluminium, cat, kotoran, atau material asing lainnya) didalam sistem']),
    '[true, false, true, true]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kurangnya lubrikasi (untuk pelumasan dan pendinginan)', 'Piston macet didalam barrel']),
    '[true, false, true, false]': results[ResultCode.adhesiveWear]?.copyWith(causes: ['Kurangnya lubrikasi (untuk pelumasan dan pendinginan)', 'Piston macet didalam barrel']),
    '[true, false, false, true]': results[ResultCode.overheating]?.copyWith(causes: ['Oli overheat yang mengalir dalam sistem']),
    '[true, false, false, false, true]': results[ResultCode.overpressure]?.copyWith(causes: ['Thermal fatigue', 'Ketidakseimbangan pump/port plate yang telah melengkung']),
    '[false, true, true]': results[ResultCode.brittleFracture]?.copyWith(causes: ['Overload', 'Piston macet dalam lubang', 'Operasi bertekanan tinggi']),
    '[false, true, false, true]': results[ResultCode.rotatingBendingFatigue]?.copyWith(causes: ['Cyclic load', 'Misalignment']),
  }),
];
