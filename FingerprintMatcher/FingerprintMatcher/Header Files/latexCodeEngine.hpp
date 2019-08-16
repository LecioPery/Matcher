#ifndef LATEX_CODE_ENGINE__
#define LATEX_CODE_ENGINE__

#include <iostream>
#include <vector>
#include <string>

class LaTeXCoder
{
	
	private:
		int chaptersCount;
		std::ofstream *source;
		std::string filePath;
		
		void codeStart( std::string rootPath );
		void directoryTree( std::string rootPath );
		void populateMisc( std::string miscPath );
	public:
		static void generateChapter(int chapterTemplate, int chapterID, std::string chapterPath, std::vector<std::string> order);
		LaTeXCoder(std::string filePath, int chapters);
		~LaTeXCoder();
};

#endif