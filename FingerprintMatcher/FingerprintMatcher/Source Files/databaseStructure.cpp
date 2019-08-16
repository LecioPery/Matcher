#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cmath>

#include "..\Header Files\databaseStructure.hpp"
#include "..\Header Files\commonConstants.hpp"

std::vector<float> VoFDatabase::getFNR()
{
	return fnr;
}

std::vector<float> VoFDatabase::getFPR()
{
	return fpr;
}

VoFDatabase::VoFDatabase(std::vector<std::string> presetEntries, int frr_line)
{
	
	unsigned int iterator;
	
	for (iterator = 0; iterator < presetEntries.size(); iterator++)
	{
		
		std::cout << presetEntries.at(iterator) << std::endl;
		includeFinger(presetEntries.at(iterator));
		
	}
	evaluateFNR();
	evaluateFPR(frr_line);
	
}

float VoFDatabase::distanceFingers(Finger *finger1, Finger *finger2, int sampleID)
{
	
	std::vector<float> sample1Features;
	std::vector<float> sample2Features;
	
	float buffer[FINGERCODE_AMOUNT];
	float result;
	
	int fingerCodeIterator;
	int blockIterator;
	
	result = 0.0f;
	
	sample1Features = finger1->getSample(sampleID - 1)->getFeatures();;
	sample2Features = finger2->getSample(sampleID - 1)->getFeatures();
	
	for (fingerCodeIterator = 0; fingerCodeIterator < FINGERCODE_AMOUNT; fingerCodeIterator++)
	{
		
		buffer[fingerCodeIterator] = 0;
		for (blockIterator = 0; blockIterator < FINGERCODE_LENGTH; blockIterator += FINGERCODE_AMOUNT)
		{
			
			buffer[fingerCodeIterator] += (sample1Features.at(blockIterator + fingerCodeIterator) - sample2Features.at(blockIterator + fingerCodeIterator)) * (sample1Features.at(blockIterator + fingerCodeIterator) - sample2Features.at(blockIterator + fingerCodeIterator));
			
		}
		buffer[fingerCodeIterator] = sqrt(buffer[fingerCodeIterator]);
		
	}
	for (fingerCodeIterator = 0; fingerCodeIterator < FINGERCODE_AMOUNT; fingerCodeIterator++) result += buffer[fingerCodeIterator];
	
	return result;
	
}

void VoFDatabase::evaluateDistances(int sampleID)
{
	
	int firstIterator;
	int secondIterator;
	
	for (firstIterator = 0; firstIterator < DATABASE_SIZE - 1; firstIterator++)
	{
		
		for (secondIterator = firstIterator + 1; secondIterator < DATABASE_SIZE; secondIterator++)
		{
			
			fingersDistanceVector.push_back(VoFDatabase::distanceFingers(fingers.at(firstIterator), fingers.at(secondIterator), sampleID));
			
		}
		
	}
	
}

int VoFDatabase::getFalsePositive(float threshold)
{
	
	unsigned int iterator;
	int result;
	
	result = 0;
	for (iterator = 0; iterator < fingersDistanceVector.size(); iterator++)
	{
		
		if (fingersDistanceVector.at(iterator) - threshold < 0) result++;
		
	}
	
	return result;
	
}

void VoFDatabase::includeFinger(std::string filename)
{
	Finger *finger;
	finger = new Finger(filename);
	fingers.push_back(finger);
}

void VoFDatabase::evaluateFNR()
{

	int innerIterator;
	int outerIterator;
	int currentBuffer;

	currentBuffer = 0;
	for (outerIterator = 0; outerIterator < MAX_THRESHOLD + 1; outerIterator = outerIterator + STEP_THRESHOLD)
	{
		
		for (innerIterator = 0; innerIterator < DATABASE_SIZE; innerIterator++)
		{
			
			currentBuffer += fingers.at(innerIterator)->getFalseNegative((float) outerIterator);
			
		}
		if (SAMPLES % 2)
		{
			
			fnr.push_back( ( (float) currentBuffer ) / ( DATABASE_SIZE * SAMPLES * (SAMPLES - 1)/2) );
			
		}
		else fnr.push_back( ( (float) currentBuffer ) / ( DATABASE_SIZE * SAMPLES/2 * (SAMPLES - 1) ) );
		currentBuffer = 0;
		
	}
	
}

void VoFDatabase::evaluateFPR(int sampleID)
{
	
	unsigned int iterator;
	int currentBuffer;
	
	evaluateDistances(sampleID);
	
	currentBuffer = 0;
	for (iterator = 0; iterator < MAX_THRESHOLD + 1; iterator = iterator + STEP_THRESHOLD)
	{
		
		currentBuffer += getFalsePositive((float) iterator);
		if (DATABASE_SIZE % 2)
		{

			fpr.push_back( ( (float) currentBuffer ) / ( DATABASE_SIZE * (DATABASE_SIZE - 1)/2 ) );

		}
		else fpr.push_back( ( (float) currentBuffer ) / ( DATABASE_SIZE/2 * (DATABASE_SIZE - 1) ) );
		currentBuffer = 0;
		
	}
	
}

Finger::Finger(std::string fingerID)
{
	
	loadSamples(fingerID);
	evaluateDistances();
	
}

void Finger::loadSamples(std::string fingerID)
{

	Sample *sample;
	unsigned int iterator;
	std::string iteratorString;

	for (iterator = 1; iterator < SAMPLES + 1; iterator++)
	{

		iteratorString = std::to_string(iterator);
		sample = new Sample(fingerID + "_" + iteratorString + ".txt");
		samples.push_back(sample);

	}

}

void Finger::evaluateDistances()
{
	
	int firstIterator;
	int secondIterator;
	
	for (firstIterator = 0; firstIterator < SAMPLES - 1; firstIterator++)
	{
		
		for (secondIterator = firstIterator + 1; secondIterator < SAMPLES; secondIterator++)
		{
			
			samplesDistanceVector.push_back(Finger::distanceSamples(samples.at(firstIterator), samples.at(secondIterator)));
			
		}
		
	}
	
}

float Finger::distanceSamples(Sample *sample1, Sample *sample2)
{
	
	std::vector<float> sample1Features;
	std::vector<float> sample2Features;
	
	float buffer[FINGERCODE_AMOUNT];
	float result;

	int fingerCodeIterator;
	int blockIterator;

	result = 0.0f;

	sample1Features = sample1->getFeatures();
	sample2Features = sample2->getFeatures();

	for (fingerCodeIterator = 0; fingerCodeIterator < FINGERCODE_AMOUNT; fingerCodeIterator++)
	{
		
		buffer[fingerCodeIterator] = 0;
		for (blockIterator = 0; blockIterator < FINGERCODE_LENGTH; blockIterator += FINGERCODE_AMOUNT)
		{
			
			buffer[fingerCodeIterator] += ( sample1Features.at(blockIterator + fingerCodeIterator) - sample2Features.at(blockIterator + fingerCodeIterator) ) * ( sample1Features.at(blockIterator + fingerCodeIterator) - sample2Features.at(blockIterator + fingerCodeIterator) );
			
		}
		buffer[fingerCodeIterator] = sqrt(buffer[fingerCodeIterator]);
		
	}
	for (fingerCodeIterator = 0; fingerCodeIterator < FINGERCODE_AMOUNT; fingerCodeIterator++) result += buffer[fingerCodeIterator];

	return result;
	
}

Sample *Finger::getSample(int ID)
{
	
	return samples.at(ID);
	
}

int Finger::getFalseNegative(float threshold)
{

	unsigned int iterator;
	int result;

	result = 0;
	for (iterator = 0; iterator < samplesDistanceVector.size(); iterator++)
	{
		if(samplesDistanceVector.at(iterator) - threshold > 0) result++;
	}

	return result;

}

std::vector<float> Finger::getVector()
{
	return samplesDistanceVector;
}

Sample::Sample(std::string filename)
{
	
	std::ifstream source(filename);
	std::string line;
	
	for (std::string line; std::getline(source, line); )   //read stream line by line
	{
		
		std::istringstream in(line);      //make a stream for the line itself
		float feature;
		in >> feature;
		features.push_back(feature);
		
	}
	
}

std::vector<float> Sample::getFeatures()
{
	return features;
}
