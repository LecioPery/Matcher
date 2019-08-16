#ifndef TRICKY_LIB__
#define TRICKY_LIB__

#include <vector>

#include "commonConstants.hpp"

/* Uma amostra: */
class Sample {
private:
	/* O vetor de Features: */
	std::vector<float> features;
public:
	Sample(std::string filename);
	std::vector<float> getFeatures();
};

/* Um dedo com várias amostras: */
class Finger {
private:
	/* O vetor de amostras do dedo: cada uma com seus vetor de features interno. */
	std::vector<Sample *> samples;
	std::vector<float> samplesDistanceVector;
	
	float distanceSamples(Sample *sample1, Sample *sample2);
	void loadSamples(std::string fingerID);
	void evaluateDistances();
public:
	Finger(std::string filename);
	Sample *getSample(int ID);
	int getFalseNegative(float threshold);
	std::vector<float> getVector();
};

/* Vector of Features Database, o banco de vetores de features correspondente à cada dedo: */
class VoFDatabase {
private:
	std::vector<Finger *> fingers;
	std::vector<float> fingersDistanceVector;
	std::vector<float> fnr;
	std::vector<float> fpr;
	
	float distanceFingers(Finger *finger1, Finger *finger2, int sampleID);
	void evaluateDistances(int sampleID);
	int getFalsePositive(float threshold);
	
	void includeFinger(std::string filename);
	void evaluateFNR(); /* Falso negativo. */
	void evaluateFPR(int sampleID); /* Falso positivo. */
public:
	std::vector<float> getFNR();
	std::vector<float> getFPR();
	VoFDatabase(std::vector<std::string>, int frr_line);
	//std::float evaluateEER(); /* Equal error rate. */
};

#endif
