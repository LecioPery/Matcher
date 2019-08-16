#include "..\Header Files\databaseOperator.hpp"
#include "..\Header Files\commonConstants.hpp"

std::vector<std::string> Entry::getEntries()
{
	return presetEntries;
}

void Entry::insertEntry(std::string entry)
{
	presetEntries.push_back(entry);
}

Entry::Entry()
{
	/* The huge DNB!!! */
}

std::vector<VoFDatabase *> DatabaseMaker::getDatabases()
{
	return databases;
};

DatabaseMaker::DatabaseMaker(std::vector<std::string> allEntries, int frr_line)
{
	
	unsigned int iterator;
	std::vector<Entry *> entries;
	
	if (allEntries.size() % DATABASE_SIZE != 0) std::cout << "Database mismatch: not all of them have same size!" << std::endl;

	for (iterator = 0; iterator < allEntries.size();)
	{
		
		Entry *newEntry = new Entry();
		do
		{
			
			newEntry->insertEntry(allEntries.at(iterator));
			iterator++;
			
		} while ( ( iterator % DATABASE_SIZE ) != 0 );
		entries.push_back(newEntry);
		
	}

	for (iterator = 0; iterator < entries.size(); iterator++)
	{
		
		VoFDatabase *database;
		Entry *currentEntry;
		
		currentEntry = entries.at(iterator);
		
		database = new VoFDatabase( currentEntry->getEntries(), frr_line );
		databases.push_back(database);
		
		delete currentEntry;
		
	}
	
};

void ErrorCalculator::makeAverageFNR( std::vector<VoFDatabase *> Databases )
{
	
	unsigned int innerIterator;
	unsigned int outerIterator;

	float accumulator;
	
	for (outerIterator = 0; outerIterator < MAX_THRESHOLD / STEP_THRESHOLD + 1; outerIterator++)
	{
		
		accumulator = 0.0f;
		for (innerIterator = 0; innerIterator < Databases.size(); innerIterator++)
		{
			accumulator += Databases.at(innerIterator)->getFNR().at(outerIterator);
		}
		averageSamplesDistanceVector.push_back(accumulator/innerIterator);
		
	}
	
};

void ErrorCalculator::makeAverageFPR( std::vector<VoFDatabase *> Databases )
{
	unsigned int innerIterator;
	unsigned int outerIterator;

	float accumulator;

	for (outerIterator = 0; outerIterator < MAX_THRESHOLD / STEP_THRESHOLD + 1; outerIterator++)
	{

		accumulator = 0.0f;
		for (innerIterator = 0; innerIterator < Databases.size(); innerIterator++)
		{
			accumulator += Databases.at(innerIterator)->getFPR().at(outerIterator);
		}
		averageFingersDistanceVector.push_back(accumulator / innerIterator);

	}
	
};

std::vector<float> ErrorCalculator::getAverageFNR()
{
	
	return averageSamplesDistanceVector;
	
};

std::vector<float> ErrorCalculator::getAverageFPR()
{

	return averageFingersDistanceVector;

};

ErrorCalculator::ErrorCalculator( std::vector<VoFDatabase *> Databases )
{
	makeAverageFNR(Databases);
	makeAverageFPR(Databases);
};
