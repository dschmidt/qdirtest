#include <QDir>
#include <iostream>


int main(int argc [[maybe_unused]], char** argv [[maybe_unused]])
{
    QDir d("/");
    std::cout << "Hello World! " << d.exists() << std::endl;
    return 0;
}
