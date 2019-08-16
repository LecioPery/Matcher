#include <iostream>
#include <string>
#include <vector>
#include <algorithm>	/** std::random_shuffle was used. */

#include "..\Header Files\machineLearningEngine.hpp"

void InputSanitizer::loadInputs( std::string inputPath )
{
	
	allEntries.push_back(inputPath + "1_2");
	allEntries.push_back(inputPath + "1_3");
	allEntries.push_back(inputPath + "1_4");
	allEntries.push_back(inputPath + "1_5");
	allEntries.push_back(inputPath + "1_7");
	allEntries.push_back(inputPath + "1_8");
	allEntries.push_back(inputPath + "1_9");
	allEntries.push_back(inputPath + "1_10");
	allEntries.push_back(inputPath + "2_1");
	allEntries.push_back(inputPath + "2_3");
	allEntries.push_back(inputPath + "2_4");
	allEntries.push_back(inputPath + "2_8");
	allEntries.push_back(inputPath + "3_1");
	allEntries.push_back(inputPath + "3_4");
	allEntries.push_back(inputPath + "3_5");
	allEntries.push_back(inputPath + "4_6");
	allEntries.push_back(inputPath + "5_1");
	allEntries.push_back(inputPath + "5_2");
	allEntries.push_back(inputPath + "5_4");
	allEntries.push_back(inputPath + "5_5");
	allEntries.push_back(inputPath + "5_7");
	allEntries.push_back(inputPath + "5_8");
	allEntries.push_back(inputPath + "6_1");
	allEntries.push_back(inputPath + "6_2");
	allEntries.push_back(inputPath + "6_6");
	allEntries.push_back(inputPath + "7_1");
	allEntries.push_back(inputPath + "7_3");
	allEntries.push_back(inputPath + "7_4");
	allEntries.push_back(inputPath + "7_7");
	allEntries.push_back(inputPath + "7_8");
	allEntries.push_back(inputPath + "7_10");
	allEntries.push_back(inputPath + "8_1");
	allEntries.push_back(inputPath + "8_2");
	allEntries.push_back(inputPath + "8_3");
	allEntries.push_back(inputPath + "8_4");
	allEntries.push_back(inputPath + "8_8");
	allEntries.push_back(inputPath + "8_10");
	allEntries.push_back(inputPath + "9_5");
	allEntries.push_back(inputPath + "9_7");
	allEntries.push_back(inputPath + "9_10");
	allEntries.push_back(inputPath + "10_1");
	allEntries.push_back(inputPath + "10_3");
	allEntries.push_back(inputPath + "10_4");
	allEntries.push_back(inputPath + "10_7");
	allEntries.push_back(inputPath + "10_10");
	allEntries.push_back(inputPath + "11_1");
	allEntries.push_back(inputPath + "11_3");
	allEntries.push_back(inputPath + "11_6");
	allEntries.push_back(inputPath + "11_8");
	allEntries.push_back(inputPath + "11_9");
	allEntries.push_back(inputPath + "12_5");
	allEntries.push_back(inputPath + "12_8");
	allEntries.push_back(inputPath + "13_3");
	allEntries.push_back(inputPath + "13_4");
	allEntries.push_back(inputPath + "13_5");
	allEntries.push_back(inputPath + "13_7");
	allEntries.push_back(inputPath + "13_8");
	allEntries.push_back(inputPath + "14_4");
	//allEntries.push_back(inputPath + "14_5");
	allEntries.push_back(inputPath + "14_7");
	allEntries.push_back(inputPath + "14_8");
	allEntries.push_back(inputPath + "15_5");
	allEntries.push_back(inputPath + "15_8");
	allEntries.push_back(inputPath + "16_7");
	allEntries.push_back(inputPath + "16_8");
	allEntries.push_back(inputPath + "16_10");
	allEntries.push_back(inputPath + "17_6");
	allEntries.push_back(inputPath + "18_2");
	allEntries.push_back(inputPath + "18_6");
	allEntries.push_back(inputPath + "18_7");
	allEntries.push_back(inputPath + "18_8");
	allEntries.push_back(inputPath + "19_3");
	allEntries.push_back(inputPath + "19_4");
	allEntries.push_back(inputPath + "19_5");
	allEntries.push_back(inputPath + "19_7");
	allEntries.push_back(inputPath + "19_8");
	allEntries.push_back(inputPath + "19_9");
	allEntries.push_back(inputPath + "20_1");
	allEntries.push_back(inputPath + "20_2");
	allEntries.push_back(inputPath + "20_5");
	allEntries.push_back(inputPath + "20_7");
	
};

//#include <fstream>
#include "..\Header Files\commonConstants.hpp"

std::vector<std::string> InputSanitizer::randomizeInputs( int i )
{
	int iterator;

	std::string outputPath = OUTPUT_PATH;

	std::vector<std::string> result(allEntries);
	std::random_shuffle(result.begin(), result.end());
	/*std::ofstream *miscfile = new std::ofstream(outputPath + "vector" + std::to_string(i) + ".txt", std::ofstream::out);
	for (iterator = 0; iterator < result.size(); iterator++)
	{
		*(miscfile) << result.at(iterator) << std::endl;
	}
	miscfile->close();
	delete miscfile;;*/

	return result;
}

std::vector<std::string> InputSanitizer::getDatabase()
{
	return allEntries;
};

InputSanitizer::InputSanitizer(std::string inputPath)
{
	
	loadInputs( inputPath );
	
};
