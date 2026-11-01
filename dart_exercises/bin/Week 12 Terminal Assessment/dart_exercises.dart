import 'dart:async';

// ABSTRACT CLASS & MIXIN (Week 10 Concepts)

// I used an abstract class because I want to enforce a rule that every type of vehicle in this system MUST have a startEngine method.
abstract class Vehicle {
  void startEngine();
}

// I created this Mixin because Aircon is an optional feature. We can add it to specific vehicles (like the Jeepney) without forcing it on others (like the Tricycle).
mixin AirConditioned {
  void turnOnAircon() {
    print('   Aircon is ON. Brrr!');
  }
}

// BASE CLASS (Week 9 & 10 Concept)

class PublicTransport {
  String route;
  int capacity;

  // Constructor to initialize the basic data of a transport vehicle.
  PublicTransport(this.route, this.capacity);

  // A method to display the vehicle's info.
  void displayInfo() {
    print('Route: $route | Capacity: $capacity passengers');
  }
}

// DERIVED CLASS & POLYMORPHISM

// Jeepney extends PublicTransport (Inheritance) and implements Vehicle.
// It also uses the AirConditioned mixin.
class Jeepney extends PublicTransport with AirConditioned implements Vehicle {
  Jeepney(String route, int capacity) : super(route, capacity);

  // Polymorphism: I overrode startEngine to give it a specific Jeepney sound.
  @override
  void startEngine() {
    print('\n===== Jeepney Engine: "Brooommmm! Bababa ba?" =====');
  }

  // ASYNC METHOD (Week 11 Concept)

  // I made this method async because fetching data from a server takes time.
  // Using Future.delayed simulates a 2-second network load without freezing the app.
  Future<void> fetchPlayerRoster() async {
    print('\n   [System] Fetching player roster for route $route...');

    // Simulating a 2-second delay
    await Future.delayed(Duration(seconds: 2));

    print('\n   [System] Data fetched successfully!');
  }
}

// Another derived class to demonstrate Polymorphism.
class Tricycle extends PublicTransport implements Vehicle {
  Tricycle(String route, int capacity) : super(route, capacity);

  @override
  void startEngine() {
    print('\n===== Tricycle Engine: "Tugutututug!" =====');
  }
}

// MAIN PROGRAM

// I made main() async because I need to use the 'await' keyword later.
void main() async {
  print('\n - Milestone 2: Transport System -');

  // Instantiating the objects.
  Jeepney jeep1 = Jeepney('Quiapo - Cubao', 16);
  Tricycle trike1 = Tricycle('Barangay 1 - Barangay 2', 4);

  // Putting them in a list of Vehicles to demonstrate Polymorphism in a loop.
  List<Vehicle> activeVehicles = [jeep1, trike1];

  for (var vehicle in activeVehicles) {
    // The startEngine method behaves differently depending on the object.
    vehicle.startEngine();
    (vehicle as PublicTransport).displayInfo();

    // I used the 'is' keyword to check if the vehicle is a Jeepney so I can use its specific methods (displayInfo and the Mixin).
    if (vehicle is Jeepney) {
      vehicle.turnOnAircon();

      // PROOF OF NON-BLOCKING (Week 11): This prints BEFORE the 2-second delay finishes.
      print('\n   [UI Thread] App is still responsive while loading data...');

      // Using await to pause the main function until the fetch is complete.
      await vehicle.fetchPlayerRoster();
    }
  }

  print('\n - Program Finished -');
}
