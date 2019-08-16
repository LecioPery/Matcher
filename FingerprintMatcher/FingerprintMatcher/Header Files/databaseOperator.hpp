#ifndef DATABA_OPERATOR__
#define DATABA_OPERATOR__

#include <iostream>
#include <vector>

#include "..\Header Files\commonConstants.hpp"
#include "..\Header Files\databaseStructure.hpp"

class Entry
{
private:
	std::vector<std::string> presetEntries;
public:
	std::vector<std::string> getEntries();
	void insertEntry( std::string );
	Entry();
};

class DatabaseMaker
{
	private:
		std::vector<VoFDatabase *> databases;
	public:
		std::vector<VoFDatabase *> getDatabases();
		DatabaseMaker::DatabaseMaker( std::vector<std::string> allEntries, int frr_line );
};

class ErrorCalculator
{
	private:
		std::vector<float> averageSamplesDistanceVector;
		std::vector<float> averageFingersDistanceVector;
		void makeAverageFNR( std::vector<VoFDatabase *> Databases );
		void makeAverageFPR( std::vector<VoFDatabase *> Databases );
	public:
		std::vector<float> getAverageFNR();
		std::vector<float> getAverageFPR();
		ErrorCalculator::ErrorCalculator( std::vector<VoFDatabase *> Databases );
};

#endif
