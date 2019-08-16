#ifndef MATLAB_CODE_ENGINE__
#define MATLAB_CODE_ENGINE__

#include <iostream>
#include <vector>
#include "commonConstants.hpp"

#define EER_ONLY 0
#define FNRXFPR 1
#define BOTH_EER_FNRXFPR 2

class MatlabCoder
{
	private:
		int graphicsCount;
		std::ofstream *source;
		#ifdef MONTE_CARLO
		std::ofstream *monteCarlo;
		#endif
		std::vector<std::string> labels;
		bool addEERFlag;
		bool FNRXFPRGraph;
		std::string prefixName;
		
		void codeStart();
		void addPrinters();
		void addConfigs();
		void consummate();
	public:
		void addFloatGraph( std::vector<float> imageVector, std::string label );
		void setParameters(int option);
		static void MatlabCoder::batchMaker(std::string filepath, std::string filename, int batchID);
		static void MatlabCoder::monteCarloBatchMaker(std::string filepath, std::string filename, int batchID);
		static void MatlabCoder::masterMaker(std::string filepath, std::string filename);
		static void MatlabCoder::monteCarloMasterMaker(std::string filepath, std::string filename);
		MatlabCoder(std::string filepath, std::string filename);
		~MatlabCoder();
};

#endif
