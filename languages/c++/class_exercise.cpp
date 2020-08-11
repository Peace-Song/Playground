#include <iostream>

class Unit {
private:
    char *name;
    int hp;
    int damage;
    int armor;
    bool is_airborne;

public:
    Unit(char* name, int hp, int damage, int armor, bool is_airborne);
    ~Unit();

    void show_stat();
};

Unit::Unit(char* name, int hp, int damage, int armor, bool is_airborne) {
    this->name = new char[strlen(name) + 1];
    strcpy(this->name, name);

    this->hp = hp;
    this->damage = damage;
    this->armor = armor;
    this->is_airborne = is_airborne;

    std::cout << "Unit construction complete!" << std::endl;
}

Unit::~Unit() {
    std::cout << "Unit " << this->name << " destroyed" << std::endl;
    // if (this->name != NULL) {
    //     delete[] this->name;
    // }
}

void Unit::show_stat() {
    std::cout << "Unit name: " << this->name << std::endl;
    std::cout << "HP: " << this->hp << std::endl;
    std::cout << "Damage: " << this->damage << std::endl;
    std::cout << "Unit type: " << (this->is_airborne ? "Airborne" : "Ground") << std::endl;
}

int main() {
    Unit unit1 = Unit("marine", 50, 6, 0, false);
    Unit *unit2 = new Unit("zergling", 35, 5, 0, false);

    unit1.show_stat();
    unit2->show_stat();

    delete &unit1;  // executed -> Unit() is stored in heap
    // delete unit2;   // not executed -> new Unit() is not stored in heap

    return 0;
}