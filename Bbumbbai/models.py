class Member:
  def __init__(self, name):
    self.name = name
    self.purchased_items = []
    self.benefitted_items = []
    
  def add_purchased_items(self, item):
    self.purchased_items.append(item)
    print("Added {item_name}.".format(item_name=item.name))

  def add_benefitted_items(self, item):
    self.benefitted_items.append(item)

  def show_member_info(self):
    print("Name: {name}".format(name=self.name))
    
    print("Purchased Items:")
    for item in self.purchased_items:
      print("{item}|{price}".format(item=item.name, price=item.price))

    print("Benefitted Items:")
    for item in self.benefitted_items:
      print("{item}|{price}".format(item=item.name, price=item.price))

class Item:
  def __init__(self, name, price):
    self.name = name
    self.price = price