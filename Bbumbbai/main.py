from models import Member, Item

def main():
  member_list = list()
  item_list = list()

  while True:
    name = input("Input a party member's name. Input EOF if done.\n")
    
    if name in [member.name for member in member_list]:
      print("Duplicacy in member detected. try again.\n")
      continue

    if name == "EOF":
      break

    purchase_item = input("Input what item did the member buy. Hit enter if none.\n")

    if purchase_item in [item.name for item in item_list]:
      print("Duplicacy in item detected. try again.\n")
      continue

    purchase_amount = 0
    if purchase_item != "":
      purchase_amount = input("Input how much did the member spend.\n")

    benefit_item_names = list()
    while True:
      benefit_item_name = input("Input what item did the member benefit from. Hit EOF if done.\n")

      if benefit_item_name == "EOF":
        break

      benefit_item_names.append(benefit_item_name)


    new_member = Member(name, purchase_item, purchase_amount, benefit_item_names)
    member_list.append(new_member)      
      
    if purchase_item != "":
      new_item = Item(purchase_item, int(purchase_amount), name, 0)
      item_list.append(new_item)

  calculate_benefiters_number(member_list, item_list)
  personal_declarer(member_list, item_list)



def calculate_benefiters_number(member_list, item_list):
  for member in member_list:
    for benefit_item_name in member.benefit_item_names:
      for item in item_list:
        if benefit_item_name == item.name:
          item.benefitee_number = item.benefitee_number + 1

def personal_declarer(member_list, item_list):
  for member in member_list:
    benefit_item_names = ""
    paycheck_sum = 0
    for benefit_item_name in member.benefit_item_names:
      benefit_item_names = benefit_item_names + benefit_item_name + " "
      for item in item_list:
        if item.name == benefit_item_name:
          paycheck_sum += item.price / item.benefitee_number

    print("{name} purchased item {purchase_item} and it costed {purchase_amount}." \
      "{name} benefitted from item {benefitted_items}, thus has to pay {paycheck_amount}.".format(name=member.name, purchase_item=member.purchase_item, purchase_amount=member.purchase_amount, benefitted_items=benefit_item_names, paycheck_amount=paycheck_sum))

if __name__ == "__main__":
  main()