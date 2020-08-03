#include <iostream>

int& fn() {
    int a = 50;
    return a;
}

int main() {
    int b = fn();

    b = 10;

    return 0;
}

// why the fuck is this working?