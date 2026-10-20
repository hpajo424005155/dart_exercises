class Jeepney {
  String route;
  int seats;

  String _engineStatus;

  Jeepney(this.route, this.seats) : _engineStatus = 'Off';

  void startEngine() {
    _engineStatus = 'On';
    print('Jeepney on route $route: Engine is now $_engineStatus. Vroom!');
  }

  String getEngineStatus() {
    return _engineStatus;
  }
}

void main() {
  List<Jeepney> activeJeepneys = [];

  Jeepney jeep1 = Jeepney('Quiapo - Cubao', 16);
  Jeepney jeep2 = Jeepney('Baclaran - Divisoria', 23);

  activeJeepneys.add(jeep1);
  activeJeepneys.add(jeep2);

  print('- Jeepney Terminal System -');

  for (var jeep in activeJeepneys) {
    print('\nRoute: ${jeep.route} | Capacity: ${jeep.seats} passengers');
    print('Status before start: ${jeep.getEngineStatus()}');

    jeep.startEngine();
  }
}
