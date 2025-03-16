import csv


class Item:
    discount_price = 0.9
    all = []

    def __init__(self, name: str, price: int, quantity: int):
        assert price > 0, f"price {price} is not greater than zero"
        self.name = name
        self.price = price
        self.quantity = quantity

        # Append the values

        Item.all.append(self)

    def total_price(self):
        return self.price * self.quantity

    def discount(self):
        self.price = self.price * self.discount_price

    # Special method to represent to printing the objects in our own understanable term

    @classmethod
    def csv_method(cls):
        with open('items.csv', 'r') as f:
            reader = csv.DictReader(f)
            items = list(reader)
        for item in items:
            Item(

                name=item.get('name')
            )

    def __repr__(self):
        return f"Item('{self.name}','{self.price}','{self.quantity}')"


item1 = Item("Phone", 100, 1)
item2 = Item("Laptop", 1000, 3)
item3 = Item("Cable", 10, 5)
item4 = Item("Mouse", 50, 5)
item5 = Item("Keyboard", 75, 5)

Item.csv_method()

# print(Item.all)

# for instance in Item.all:
#     print(instance.quantity)


# print(item.total)
# print(calculator.discount)
# print(item.discount, "instance printing")
