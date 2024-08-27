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

class Question {
  String question;
  List<String> images;
  int positiveAnswerIndexCursor;
  int negativeAnswerIndexCursor;

  Question(this.question, this.images, this.positiveAnswerIndexCursor, this.negativeAnswerIndexCursor);
}

class Result {
  String definition;
  List<String> causes;

  Result(this.definition, this.causes);
}

class Engine {
  String name;
  Code code;
  Category category;
  bool availability;
  List<Question> questions;
  Map<String, Result> results;

  Engine(this.name, this.code, this.category, this.availability, this.questions, this.results);
}

List<Engine> engines = [
  Engine('Engine Bearing', Code.engineBearing, Category.engine, false, [], {}),
  Engine('Crankshaft', Code.crankshaft, Category.engine, false, [], {}),
  Engine('Connecting Rod', Code.connectionRod, Category.engine, false, [], {}),
  Engine('Piston, Rings & Liner', Code.pistonRingLiner, Category.engine, false, [], {}),
  Engine('Valves', Code.valves, Category.engine, false, [], {}),
  Engine('Turbocharger', Code.turbocharger, Category.engine, false, [], {}),
  Engine('Threaded Fastener', Code.threadedFastener, Category.engine, false, [], {}),
  Engine('Gear', Code.gear, Category.powertrain, !true, [], {}),
  Engine('Shaft', Code.shaft, Category.powertrain, !true, [], {}),
  Engine('Bearing', Code.bearing, Category.powertrain, !true, [], {}),
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
    '[false, true]': Result('Patahan pada gear pump sangat jarang terjadi, apabila terdapat patahan pada gear pump, patahan tersebut tergolong patahan brittle, ductile, ataupun patahan fatigue.', []),
    '[false, false]': Result('Good condition', []),
    '[true, false, false, false]': Result('Good condition', []),
    '[true, true, true, false, false, false]': Result('Good condition', []),
    '[true, true, false, false, false, false]': Result('Good condition', []),
    '[true, true, true, true, true]': Result('Abrasive Wear pada gear teeth & shaft, pressure plate, pump housing (inlet port)', ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, true, true, false]': Result('Abrasive Wear pada gear teeth & shaft, pressure plate, pump housing (inlet port)', ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, false, true, true]': Result('Abrasive Wear pada gear teeth & shaft, pressure plate, pump housing (inlet port)', ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, true, false, true, false]': Result('Abrasive Wear pada gear teeth & shaft, pressure plate, pump housing (inlet port)', ['Kontaminan dari lingkungan kerja, tangka, tabung filter', 'Kontaminan dari seal yang rusak', 'Partikel dari bushing yang mengalami keausan', 'Tekanan dari sisi inlet port yang membengkokkan shaft ke sisi inlet sehingga mengikis housing pump bagian inlet port (permukaan material housing pump yang lunak)']),
    '[true, false, true]': Result('Overheating pada shaft & gear, pressure plate', ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, true, true, false, true]': Result('Overheating pada shaft & gear, pressure plate', ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, true, false, false, true]': Result('Overheating pada shaft & gear, pressure plate', ['Operasi yang tidak tepat', 'Penggunaan fluida yang salah', 'Komponen pump yang tidak berfungsi', 'Cara assemble pump yang salah']),
    '[true, false, false, true]': Result('Overpressure pada flange gear pump (outlet side karena adanya high pressure)', ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
    '[true, true, true, false, false, true]': Result('Overpressure pada flange gear pump (outlet side karena adanya high pressure)', ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
    '[true, true, false, false, false, true]': Result('Overpressure pada flange gear pump (outlet side karena adanya high pressure)', ['Overpressure', 'Operating condition yang salah', 'Terjadi masalah pada operasi pressure relief valve']),
  }),
  Engine('Vane Pump', Code.vanePump, Category.hydraulic, !true, [], {}),
  Engine('Piston Pump & Motor', Code.pistonPumpMotor, Category.hydraulic, !true, [], {}),
];

const results = <List<bool>, dynamic>{
  [true, false, true]: 'Hai Hai',
};
