abstract class Vehicle {
  void startEngine();
}

mixin AirConditioned {
  void turnOnAircon() {
    print('Aircon is ON. Brrr! (Cooling the passengers)');
  }
}

class PublicTransport {
  String route;
  int capacity;

  PublicTransport(this.route, this.capacity);

  void displayInfo() {
    print('Route: $route | Capacity: $capacity passengers');
  }
}

class Jeepney extends PublicTransport with AirConditioned implements Vehicle {
  Jeepney(String route, int capacity) : super(route, capacity);

  @override
  void startEngine() {
    print('Jeepney Engine: "Broooommm! Bababa ba?"');
  }
}

class Bus extends PublicTransport implements Vehicle {
  Bus(String route, int capacity) : super(route, capacity);

  @override
  void startEngine() {
    print('Bus Engine: "BZZZT! (Loud diesel sound)"');
  }
}

void main() {
  print('= Week 10: Enhanced OOP Terminal =\n');

  Jeepney jeep1 = Jeepney('Quiapo - Cubao', 16);
  Bus bus1 = Bus('PITX - Fairview', 30);

  List<Vehicle> activeVehicles = [jeep1, bus1];

  for (var vehicle in activeVehicles) {
    vehicle.startEngine();

    if (vehicle is Jeepney) {
      vehicle.displayInfo();
      vehicle.turnOnAircon();
    } else if (vehicle is Bus) {
      bus1.displayInfo();
    }
    print('////////////////');
  }
}
