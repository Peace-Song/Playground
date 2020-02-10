class Member:
  def __init__(self, name, purchase_item, purchase_amount, benefit_item_names):
    self.name = name
    self.purchase_item = purchase_item
    self.purchase_amount = purchase_amount
    self.benefit_item_names = benefit_item_names

class Item:
  def __init__(self, name, price, payer, benefitee_number):
    self.name = name
    self.price = price
    self.payer = payer
    self.benefitee_number = benefitee_number

