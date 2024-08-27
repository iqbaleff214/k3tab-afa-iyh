enum NameCode {
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

class Engine {
  String name;
  NameCode code;
  Category category;
  bool availability;

  Engine(this.name, this.code, this.category, this.availability);
}

List<Engine> dataSourceEngine = [
  Engine('Engine Bearing', NameCode.engineBearing, Category.engine, false),
  Engine('Crankshaft', NameCode.crankshaft, Category.engine, false),
  Engine('Connecting Rod', NameCode.connectionRod, Category.engine, false),
  Engine('Piston, Rings & Liner', NameCode.pistonRingLiner, Category.engine, false),
  Engine('Valves', NameCode.valves, Category.engine, false),
  Engine('Turbocharger', NameCode.turbocharger, Category.engine, false),
  Engine('Threaded Fastener', NameCode.threadedFastener, Category.engine, false),
  Engine('Gear', NameCode.gear, Category.powertrain, true),
  Engine('Shaft', NameCode.shaft, Category.powertrain, true),
  Engine('Bearing', NameCode.bearing, Category.powertrain, true),
  Engine('Gear Pump', NameCode.gearPump, Category.hydraulic, true),
  Engine('Vane Pump', NameCode.vanePump, Category.hydraulic, true),
  Engine('Piston Pump & Motor', NameCode.pistonPumpMotor, Category.hydraulic, true),
];

const dataSourceQuestion = <NameCode, dynamic>{
  NameCode.engineBearing: 'test'
};
