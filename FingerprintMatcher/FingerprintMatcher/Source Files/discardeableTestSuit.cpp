#include <iostream>

#include "..\Header Files\discardeableTestSuit.hpp"
#include "..\Header Files\commonConstants.hpp"
#include "..\Header Files\databaseStructure.hpp"
#include "..\Header Files\databaseOperator.hpp"

BasicTests::BasicTests(int frr_line)
{

	std::string path = INPUT_PATH;
	/* Passo 0: filtragem de proibidos. Feito manualmente, refletirá nos passos 3 e 4. */

	/* Passo 1: criação de tipos de dados.*/
	/* Uma amostra: */
	Sample *firstSample = new Sample(path + "1_1_1.txt");
	delete(firstSample);
	/* Um dedo */
	Finger *firstFinger = new Finger(path + "1_1");
	delete(firstFinger);
	/* Um banco de dados */

	std::vector<std::string> presetEntries;
	presetEntries.push_back(path + "1_1");
	presetEntries.push_back(path + "1_2");
	presetEntries.push_back(path + "1_3");
	presetEntries.push_back(path + "1_4");
	presetEntries.push_back(path + "1_5");
	presetEntries.push_back(path + "2_1");
	presetEntries.push_back(path + "2_2");
	presetEntries.push_back(path + "2_3");
	presetEntries.push_back(path + "2_4");
	presetEntries.push_back(path + "2_5");
	presetEntries.push_back(path + "3_1");
	presetEntries.push_back(path + "3_2");
	presetEntries.push_back(path + "3_3");
	presetEntries.push_back(path + "3_4");
	presetEntries.push_back(path + "3_5");
	presetEntries.push_back(path + "4_1");
	presetEntries.push_back(path + "4_2");
	presetEntries.push_back(path + "4_3");
	presetEntries.push_back(path + "4_4");
	presetEntries.push_back(path + "4_5");
	VoFDatabase *voFDatabase;
	voFDatabase = new VoFDatabase(presetEntries, frr_line);
	delete voFDatabase;
	
	std::cout << "Working." << std::endl;
	
};

DatabaseTests::DatabaseTests(int frr_line)
{

	std::string path = INPUT_PATH;

	Entry *newEntry;
	std::vector<std::string> sampleStringVector;
	newEntry = new Entry();
	newEntry->insertEntry(path + "1_1");
	newEntry->insertEntry(path + "1_2");
	newEntry->insertEntry(path + "1_3");
	newEntry->insertEntry(path + "2_5");
	sampleStringVector = newEntry->getEntries();
	delete newEntry;

	DatabaseMaker *databaseMaker;
	std::vector<std::string> allEntries;
	allEntries.push_back(path + "1_1");
	allEntries.push_back(path + "1_2");
	allEntries.push_back(path + "1_3");
	allEntries.push_back(path + "1_4");
	allEntries.push_back(path + "1_5");
	allEntries.push_back(path + "2_1");
	allEntries.push_back(path + "2_2");
	allEntries.push_back(path + "2_3");
	allEntries.push_back(path + "2_4");
	databaseMaker = new DatabaseMaker(allEntries, frr_line);
	delete databaseMaker;

}