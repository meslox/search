#include <iostream>
#include <cstdlib>
#include <sstream>
#include <iomanip>


std::string url_encode(const std::string& text)
{
    std::ostringstream encoded;

    for (unsigned char c : text)
    {
        if (isalnum(c) || c == '-' || c == '_' ||
            c == '.' || c == '~')
        {
            encoded << c;
        }
        else
        {
            encoded << '%' << std::uppercase << std::hex
                   << std::setw(2) << std::setfill('0')
                   << static_cast<int>(c);
        }
    }

    return encoded.str();
}

void open_browser(const std::string& url)
{
#ifdef _WIN32
    std::string command = "start \"\" \"" + url + "\"";
#elif __APPLE__
    std::string command = "open \"" + url + "\"";
#else
    std::string command = "xdg-open \"" + url + "\"";
#endif

    system(command.c_str());
}

int main(int argc, char* argv[]){
    std::string query;

    //std::cout << "Search Google: ";
    //std::getline(std::cin, query);

    if (argc < 2){
        std::cout<<"No option or Nothing to search , use -h"<<std::endl;
        std::cout<<"search -h"<<std::endl;
        return 1;
    }

    //std::cout<<argc<<std::endl;
    
    std::string option = argv[1];
    int x = 1;

    if(option[0] == '-' && (option[1] != 'y' && option[1] != 'g' && option[1] != 'h')){

        std::cout<<"Invalid option , use -h"<<std::endl;
        std::cout<<"search -h"<<std::endl;
        return 1;
    }

    if (option == "-h"){

        std::cout<<"Search  anything in google : > search how to make something "<<std::endl;
        std::cout<<"                     or    : > search -g how to make something "<<std::endl;
        std::cout<<"Search  anything in youtube: > search -y how to make something "<<std::endl;
        return 1;
    }

    if (option == "-y" || option == "-g"){
        x = 2;
    }

    for (int i = x ; i < argc ; i++){
        query += argv[i] + (std::string)" ";
    }

    if (query.empty())
    {
        std::cout << "Search input is empty!\n";
        return 1;
    }


    std::string url;

    if (option == "-y"){
        url =
            //"https://www.google.com/search?q=" +
            "https://www.youtube.com/results?search_query=" +
            url_encode(query);
    }

    else if (option == "-g"){
        url =
            "https://www.google.com/search?q=" +
            url_encode(query);
    }

    else{
        url =
            "https://www.google.com/search?q=" +
            url_encode(query);
    }


    open_browser(url);

    return 0;
}
