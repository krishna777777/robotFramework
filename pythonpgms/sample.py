class Car:
    def __init__(self, make, model, year, initial_miles=0):
        self.make = make
        self.model = model
        self.year = year
        self.miles = initial_miles

    def drive(self, miles):
        print(f"Driving {miles} miles...")
        self.miles += miles

    def display_info(self):
        print(f"{self.year} {self.make} {self.model}, Mileage: {self.miles} miles")

# Create an instance of the Car class
my_car = Car(make="Toyota", model="Camry", year=2022, initial_miles=1000)

# Display initial information
my_car.display_info()

# Drive the car and display updated information
my_car.drive(50)
my_car.display_info()

# Drive the car more and display updated information
my_car.drive(30)
my_car.display_info()
