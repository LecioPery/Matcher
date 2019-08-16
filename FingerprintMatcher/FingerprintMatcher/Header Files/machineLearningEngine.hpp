#ifndef MACHINE_LEARNING_ENGINE__
#define MACHINE_LEARNING_ENGINE__

#include <iostream>
#include <string>
#include <vector>

class InputSanitizer
{
	private:
		std::vector<std::string> allEntries;
	public:
		void InputSanitizer::loadInputs( std::string inputPath );
		std::vector<std::string> InputSanitizer::randomizeInputs( int i ); /* Fixme: should have no params. */
		std::vector<std::string> InputSanitizer::getDatabase();
		InputSanitizer::InputSanitizer( std::string inputPath );
};

#endif
