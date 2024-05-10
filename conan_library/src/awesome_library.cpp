#include <iostream>
#include "awesome_library.h"

void awesome_library(){
    #ifdef NDEBUG
    std::cout << "awesome_library/1.0: Hello World Release!" <<std::endl;
    #else
    std::cout << "awesome_library/1.0: Hello World Debug!" <<std::endl;
    #endif
}
