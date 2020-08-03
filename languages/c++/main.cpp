#include <stdio.h>
#include <iostream>

namespace test {
    int test_var = 4;
    void test_fn() {
        std::cout << "test function" << std::endl;
        std::cout << "test_var == " << test_var << std::endl;
        return;
    }
}

int main() {
    printf("Hello, World!\n");
    std::cout << "This works too!" << " " << "But with new line at the end!" << std::endl;

    test::test_fn();

    return 0;
}