from models import Member, Item

def main():
  member_list = list()
  item_list = list()

  print_logo()

  while True:
    print_console()

    command = input(">>> ")

    if command == "INIT":
      define_members(member_list)
      define_items(member_list, item_list)

    elif command == "SHOW":
      show_member_info(member_list)
    
    elif command == "CALC":
      calculate(member_list, item_list)
    
    elif command == "EXIT":
      break

    else:
      print("Invalid command.")

def define_members(member_list):
  # Gets input of member names, create Member object, and append them to member_list.
  while True:
    # while-loop to cope with invalid input
    print("Input party members' names, seperated by a space.")
    names = input(">>> ").split()

    if names != []: # if input is not void
      if len(names) == len(set(names)): # if there is no duplicate
        break
      else:
        print("Party members' names must be diffrent to each other.")
    else: 
      print("At least 1 party member's name required.")

  for name in names: # create Member object, append to member_list
    member = Member(name)
    member_list.append(member)


def define_items(member_list, item_list):
  # Gets input of item names, create Item object, append them to member list,
  # and update Member objects by calling add_purchased_items and add_benefitted_items methods.
  while True:
    # while-loop to cope with invalid input
    print("Input items' names, seperated by a space.")
    names = input(">>> ").split()

    if names != []: # if input is not void
      if len(names) == len(set(names)): # if there is no duplicate
        break
      else:
        print("Items' names must be diffrent to each other.")
    else: 
      print("At least 1 item's name required.")

  for name in names: # create Item object, append to item_list
    print("How much was {item_name}?".format(item_name=name))
    price = float(input(">>> "))

    item = Item(name, price)
    item_list.append(item)

    while True: # update Member object by calling add_purchased_items
      print("Who bought {item_name}?".format(item_name=name))
      member_name = input(">>> ")

      name_in_list = False
      for member in member_list:
        if member.name == member_name:
          member.add_purchased_items(item)
          name_in_list = True

      if name_in_list == True: # if given name is in the member list
        break

      print("Name is not in the member list. Try again.")

    while True: # update Member object by calling add_benefitted_items
      print("Who were benefitted from {item_name}?".format(item_name=name))
      member_names = input(">>> ").split()

      for member_name in member_names:
        name_in_list = False
        for member in member_list:
          if member.name == member_name:
            name_in_list = True
        
        if name_in_list == False: # if given name is not in the member list
          print("Name is not in the member list. Try again.")
          continue

      for member in member_list:
        if member.name in member_names:
          member.add_benefitted_items(item)
        
      break


def show_member_info(member_list):
  # Show info of a member.
  print("Input a member's name.")
  name = input(">>> ")

  for member in member_list:
    if member.name == name:
      member.show_member_info()
      return

  print("No matching name.")

  return


def calculate(member_list, item_list):
  # Calculate each member's payment.
  # balance > 0 means one should pay more, balance < 0 means one should be paid back.
  for member in member_list:
    balance = 0.0 
    
    for purchased_item in member.purchased_items: 
      balance -= purchased_item.price

    for benefitted_item in member.benefitted_items:
      benefittee_num = 0
      for _member in member_list: # calculate the number of benefittees of that item.
        if benefitted_item in _member.benefitted_items:
          benefittee_num += 1

      balance += benefitted_item.price / benefittee_num
    
    if balance > 0:
      print("{member_name} should pay {balance}.".format(member_name=member.name, balance=balance))
    elif balance < 0:
      print("{member_name} should be paid back {balance}.".format(member_name=member.name, balance=-balance))
    else:
      print("{member_name} doesn't need to pay for anything.".format(member_name=member.name))


def print_console():
  # Prints command options
  print("-------------------------------------------")
  print("MEMBER: Defines party members.")
  print("ITEM: Defines party items.")
  print("SHOW: Shows info about the member.")
  print("RESULT: Shows the calculationi result.")
  print("EXIT: Terminates the program.")
  print("-------------------------------------------")

def print_logo():
  # Prints logo
  print("==================================")
  print("|            Bbumbbai            |")
  print("==================================")

if __name__ == "__main__":
  main()
