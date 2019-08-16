#include <fstream>
#include <iostream>
#include <vector>
#include <string>

#include "..\Header Files\latexCodeEngine.hpp"
#include "..\Header Files\commonConstants.hpp"

void LaTeXCoder::directoryTree(std::string rootPath)
{
	
	std::string command;
	command = "RMDIR / s / q \"" + rootPath + "LaTeX\"";
	system(command.c_str());
	
	command = "MKDIR \"" + rootPath + "LaTeX\"";
	system(command.c_str());
		command = "MKDIR \"" + rootPath + "LaTeX/chapters\"";
		system(command.c_str());
			command = "MKDIR \"" + rootPath + "LaTeX/chapters/others\"";
			system(command.c_str());
			command = "MKDIR \"" + rootPath + "LaTeX/chapters/standard\"";
			system(command.c_str());
		command = "MKDIR \"" + rootPath + "LaTeX/images\"";
		system(command.c_str());
			command = "MKDIR \"" + rootPath + "LaTeX/images/png\"";
			system(command.c_str());
			command = "MKDIR \"" + rootPath + "LaTeX/images/jpg\"";
			system(command.c_str());

}

void LaTeXCoder::populateMisc( std::string miscPath )
{
	/* Variables: */
	std::ofstream *miscfile;

	/* disclaimer */
	miscfile = new std::ofstream(miscPath + "disclaimer.tex", std::ofstream::out);
	*(miscfile) << "\\chapter{Disclaimer}" << std::endl;
	*(miscfile) << "\\indent If you expect self indulgence, I already did on .tex files I generated. Here, I have a relevant warning: each chapter represents a set of experiments.\\\\" << std::endl;
	*(miscfile) << "\\indent Due to that, inside the chapter you can find each experiment in a subsection where the false positive x false negative graphics for all its databases can be found, and the average between the databases.\\\\" << std::endl;
	*(miscfile) << std::endl;
	*(miscfile) << "\\indent Finaly, the randomized vector and the graphic of each database performance \\textbf{across} experiments marks the end of the chaper.\\\\" << std::endl;
	miscfile->close();
	delete miscfile;

	/* motivation */
	miscfile = new std::ofstream(miscPath + "motivation.tex", std::ofstream::out);
	*(miscfile) << "\\chapter{Motivations given by Lecio}" << std::endl;
	*(miscfile) << "\\section{Lazyness}" << std::endl;
	*(miscfile) << "\\indent I could lie to you and say it was just because nobody ever done before. No. That's a POSTUMOUS valid reason. It all started because my professor Zaghetto - peace be upon my prophet - asked me to do this stonemason work. I'd rather do the 3x harder thought task than the repetitive task of collecting all this data by hand and produce all these damn graphics." << std::endl;
	*(miscfile) << "\\section{Scalability}" << std::endl;
	*(miscfile) << "\\indent Then, after doing it with some automation, he liked the results. He wanted more complex tasks and started making more complex plans. It was the last straw. As more stonemason work he added, as more I made machines to operate them. Why playing an instrument when you can make a robot to do the music for you?\\\\" << std::endl;
	*(miscfile) << "\\indent So automated ideas can be run more aggressively. I produced far more results with my lazyness than I would ever produce with my diligence, and I am not trying to sound edgy.\\\\" << std::endl;
	*(miscfile) << std::endl;
	*(miscfile) << "\\indent I just don't understand why people keep asking me all the time if I am high. Everywhere. Even my sister. Even my \\textbf{\\textit{mother}}." << std::endl;
	miscfile->close();
	delete miscfile;

	/* postscriptum */
	miscfile = new std::ofstream(miscPath + "postscriptum.tex", std::ofstream::out);
	*(miscfile) << "\\chapter{}" << std::endl;
	miscfile->close();
	delete miscfile;
}

void LaTeXCoder::codeStart( std::string rootPath )
{
	
	int iterator;
	
	source = new std::ofstream(rootPath + "/LaTeX/main.tex", std::ofstream::out);
	
	*(source) << "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                                                                                                                              %" << std::endl;
	*(source) << "%                                                                                                                                                                                                              %" << std::endl;
	*(source) << "% Brought you by the God almighty, teaming with Lecivs Pery Jun1or!                                                                                                 %" << std::endl;
	*(source) << "%                                                                                                                                                                                                              % %                                                                                                                                                                                                              %" << std::endl;
	*(source) << "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" << std::endl;
	*(source) << std::endl;
	*(source) << "%\\documentclass[11pt,twoside,a4paper]{book}" << std::endl;
	*(source) << "\\documentclass[12pt,oneside,a4paper]{book}" << std::endl;
	*(source) << std::endl;
	*(source) << "\\usepackage[brazil, american]{ babel }" << std::endl;
	*(source) << "\\usepackage[T1]{ fontenc }" << std::endl;
	*(source) << "\\usepackage{ indentfirst }" << std::endl;
	*(source) << "\\usepackage{ natbib }" << std::endl;
	*(source) << "\\usepackage{ xcolor, graphicx, url }" << std::endl;
	*(source) << "\\usepackage[utf8]{ inputenc }" << std::endl;
	*(source) << "\\usepackage{ changepage }" << std::endl;
	*(source) << "\\usepackage{ csquotes }" << std::endl;
	*(source) << "\\usepackage{ graphicx }" << std::endl;
	*(source) << "\\usepackage{ amsmath }" << std::endl;
	*(source) << "\\usepackage{ amssymb }" << std::endl;
	*(source) << "\\usepackage{ xfrac }" << std::endl;
	*(source) << "\\usepackage{ marvosym }" << std::endl;
	*(source) << "\\usepackage{ wasysym }" << std::endl;
	*(source) << "\\usepackage{ tikz }" << std::endl;
	*(source) << "\\usepackage{ euscript }" << std::endl;
	*(source) << "\\usepackage{ MnSymbol }" << std::endl;
	*(source) << "%\\usepackage{ newtxmath }" << std::endl;
	*(source) << std::endl;
	*(source) << "%Declarations:" << std::endl;
	*(source) << "%%Images:" << std::endl;
	*(source) << "\\graphicspath{ {images/} }" << std::endl;
	*(source) << "\\DeclareGraphicsExtensions{.png, .jpg}" << std::endl;
	*(source) << std::endl;
	*(source) << "%%Alphabets" << std::endl;
	*(source) << "\\DeclareMathAlphabet{ \\mathpzc }{T1} {pzc} {m} {it}" << std::endl;
	*(source) << std::endl;
	*(source) << "%%Environments" << std::endl;
	*(source) << "\\newenvironment{citebody}{\\fontsize{10pt}{12pt}\\begin{itshape}\\begin{adjustwidth}{4cm}{}}{\\end{adjustwidth}\\end{itshape}}" << std::endl;
	*(source) << std::endl;
	*(source) << "\\begin{document}" << std::endl;
	*(source) << "  \\selectlanguage{brazil}" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "  \\title{ Matcher results handbook }" << std::endl;
	*(source) << "  \\author{ Lecio Pery Junior }" << std::endl;
	*(source) << "  \\date{ 27 de agosto de 2017 - \\today }" << std::endl;
	*(source) << "  \\maketitle" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "  \\part{ Warnings }" << std::endl;
	*(source) << "    \\input{ chapters/others/disclaimer }" << std::endl;
	*(source) << "    \\input{ chapters/others/motivation }" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "%  \\tableofcontents" << std::endl;
	*(source) << "%  \\listoffigures" << std::endl;
	*(source) << "%  \\listoftables" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "%  \\part{ Experiments }" << std::endl;
	for (iterator = 1; iterator < chaptersCount + 1; iterator++)
	{
		
		*(source) << "    \\input{ chapters/standard/chapter" << iterator << " }" << std::endl;
		
	}
	*(source) << "    \\input{ chapters/standard/finalchapter }" << std::endl;
	*(source) << "  %\\input{chapters/others/postscriptum}" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "\\end{document}" << std::endl;
	
	delete source;
	
}

void LaTeXCoder::generateChapter(int chapterTemplate, int chapterID, std::string chapterPath, std::vector<std::string> order)
{
	
	int iterator;
	std::ofstream *chapter;
	chapter = new std::ofstream(chapterPath + "chapter" + std::to_string(chapterID) + ".tex", std::ofstream::out);
	
	*(chapter) << "\\chapter{" << std::to_string(chapterID) << "}" << std::endl;
	switch (chapterTemplate)
	{
		case 0:
			*(chapter) << "\\indent Here will be presented " << std::to_string( FINGERS / DATABASE_SIZE ) << " databases.\\\\" << std::endl;
		break;
		case 1:
			*(chapter) << "\\indent We have done " << std::to_string( FINGERS / DATABASE_SIZE ) << " databases.\\\\" << std::endl;
		break;
		case 2:
			*(chapter) << "\\indent As always, we have " << std::to_string( FINGERS / DATABASE_SIZE ) << " databases. We are doing the experiment number" << std::to_string(chapterID) << ".\\\\" << std::endl;
		break;
		default:
			std::cout << "Something very scary happened when making chapter " << chapterID << "!!!";
			std::cout << std::endl;
		break; /* Didatical and aestetical. :D */
	}
	*(chapter) << "The vectors are:" << std::endl;
	for (iterator = 0; iterator < order.size() - 1; iterator++)
	{
		if (((iterator % 5) == 0) && (iterator != 0)) { *(chapter) << order.at(iterator) << ".\\\\"; continue; };
		*(chapter) << order.at(iterator) << " ";
	}
	*(chapter) << order.at(iterator) << ".\\\\";
	chapter->close();
	delete chapter;
	
}

LaTeXCoder::LaTeXCoder(std::string filePath, int chapters)
{

	int k;

	/* Init chapters: */
	chaptersCount = chapters;

	/* Directory tree start: */
	directoryTree(filePath);

	/* Code Start */
	codeStart(filePath);

	/* Populate secondary folders: */
	populateMisc( filePath + "LaTeX/chapters/others/" );
	
	/* Generate main: */

}

LaTeXCoder::~LaTeXCoder()
{
	*(source) << "  " << std::endl;
	*(source) << "  %\\input{chapters/others/postclaimer}" << std::endl;
	*(source) << "  " << std::endl;
	*(source) << "\\end{document}" << std::endl;
}