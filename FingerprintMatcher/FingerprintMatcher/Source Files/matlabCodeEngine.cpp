#include <fstream>
#include <iostream>
#include <vector>

#include "..\Header Files\matlabCodeEngine.hpp"
#include "..\Header Files\commonConstants.hpp"

void MatlabCoder::codeStart()
{
	
	*(source) << "function yEER = " << prefixName.c_str() << std::endl;
	*(source) << "close all;" << std::endl << "clear;" << std::endl << "clc;" << std::endl;
	*(source) << "x = 0:" << STEP_THRESHOLD << ":" << MAX_THRESHOLD << ";" << std::endl;
	*(source) << "xq = 0:0.5:" << MAX_THRESHOLD << ";" << std::endl;
	
	#ifdef MONTE_CARLO
	*(monteCarlo) << "function yEER = " << prefixName.c_str() << "_MC" << std::endl;
	*(monteCarlo) << "x = 0:" << STEP_THRESHOLD << ":" << MAX_THRESHOLD << ";" << std::endl;
	*(monteCarlo) << "xq = 0:0.5:" << MAX_THRESHOLD << ";" << std::endl;
	#endif

}

void MatlabCoder::addPrinters()
{
	
	int iterator;
	
	*(source) << std::endl << "main = figure" << std::endl;
	for (iterator = 0; iterator < graphicsCount - 1; iterator++)
	{
		
		*(source) << "plot(xq, yy" << iterator << ",'-','LineWidth', 2);	";
		*(source) << "hold on" << std::endl;
		
	}
	*(source) << "plot(xq, yy" << iterator << ",'--','LineWidth', 2);";
	if (addEERFlag == true)
	{

		*(source) << "	hold on" << std::endl;
		*(source) << "plot([xEERIndex xEERIndex], [0 yEER], 'k--');	";
		*(source) << "hold on" << std::endl;
		*(source) << "plot([0 xEERIndex], [yEER yEER], 'k--');	";
		*(source) << "hold on" << std::endl;
		*(source) << "plot(xEERIndex, yEER, 'bx', 'LineWidth', 10);	";
		*(source) << "hold on" << std::endl;

		/** Zaghett0's contribution replacing mine that is commented:
		*(source) << "text(xEERIndex, yEER,strcat('    (', num2str(xEER), ', ', num2str(yEER * 100), ')'))" << std::endl;*/
		*(source) << "text(xEERIndex + 10 * xEERIndex / 100, yEER, [num2str(round((10000 * yEER)) / 100) '%'])" << std::endl;
		
	}
	
}

void MatlabCoder::addConfigs()
{
	
	unsigned int iterator;
	int number = 32;
	
	*(source) << "legend(";
	for (iterator = 0; iterator < labels.size(); iterator++)
	{
		*(source) << "'";
		source->write(labels.at(iterator).c_str(), sizeof(char) * labels.at(iterator).size());
		*(source) << "', "; /*fixme*/
	}
	*(source) << "'Location', 'SouthEast')" << std::endl;
	*(source) << "xlabel('Threshold')" << std::endl;
	
	/** Zaghett0's contribution replacing mine that is commented:
	*(source) << "ylabel('Error Rate(%)')" << std::endl;*/
	*(source) << "ylabel('Error Rate (\\times100%)')" << std::endl;
	*(source) << "title('Average Equal Error Rate')" << std::endl;

	*(source) << "set(gca, 'FontSize', 12)" << std::endl;
	*(source) << "axis([0 " << MAX_THRESHOLD << " 0 1])" << std::endl;
	*(source) << "grid on" << std::endl << std::endl;
	
}

void MatlabCoder::consummate()
{
	
	if (addEERFlag == true)
	{
		
		*(source) << std::endl << std::endl << "% Calculating EER: " << std::endl;
		*(source) << "y2 = abs(y0 - y1);" << std::endl << "find(y2 == min(y2))" << std::endl;
		*(source) << "yy2 = abs(yy0 - yy1);" << std::endl;
		*(source) << "xEER = find(yy2 == min(yy2));" << std::endl << "xEERIndex = xq(xEER) % X-axis EER" << std::endl;
		*(source) << "yEER = yy0(xEER) % Y-axis EER" << std::endl;
		
		#ifdef MONTE_CARLO
		*(monteCarlo) << std::endl << std::endl << "% Calculating EER: " << std::endl;
		*(monteCarlo) << "y2 = abs(y0 - y1);" << std::endl << "find(y2 == min(y2));" << std::endl;
		*(monteCarlo) << "yy2 = abs(yy0 - yy1);" << std::endl;
		*(monteCarlo) << "xEER = find(yy2 == min(yy2));" << std::endl;
		*(monteCarlo) << "yEER = yy0(xEER); % Y-axis EER" << std::endl;
		#endif

	}
	
	addPrinters();
	addConfigs();

	*(source) << "print(main, '" << prefixName.c_str() << "Main', '-dpng');";
	
	if (FNRXFPRGraph == true)
	{
		
		*(source) << std::endl << "FNRxFPR = figure('Color', [1 1 1]);" << std::endl << "plot(yy1, yy0, '-', yy1, yy0, 'LineWidth', 2);" << std::endl;
		*(source) << "hold on" << std::endl;
		*(source) << "y = -0.1:0.1:1" << std::endl << "plot(y, y); " << std::endl;
		*(source) << "set(gca, 'FontSize', 12)" << std::endl;
		*(source) << "xlabel('False Negative')" << std::endl << "ylabel('False Positive')" << std::endl;
		*(source) << "axis([-0.1 1 -0.1 1])" << std::endl;
		*(source) << "set(gca, 'FontSize', 12)" << std::endl;
		*(source) << "grid on" << std::endl << std::endl;

		*(source) << "print(FNRxFPR, '" << prefixName.c_str() << "FNRxFPR','-dpng');" << std::endl;
		
	}
	
	*(source) << "end" << std::endl;
	#ifdef MONTE_CARLO
	*(monteCarlo) << "end" << std::endl;
	monteCarlo->close();
	#endif
	
	source->close();
	
}

void MatlabCoder::addFloatGraph(std::vector<float> imageVector, std::string label)
{
	
	unsigned int iterator;
	
	iterator = 0;
	
	*(source) << std::endl << "y" << graphicsCount << " = [" << imageVector.at(iterator);
	for (iterator = 1; iterator < imageVector.size(); iterator++)
	{
		*(source) << " " << imageVector.at(iterator);
	}
	*(source) << "];" << std::endl;
	*(source) << "yy" << graphicsCount << " = interp1(x, " << "y" << graphicsCount << ", xq, 'pchip');";
	
	#ifdef MONTE_CARLO
	iterator = 0;
	*(monteCarlo) << std::endl << "y" << graphicsCount << " = [" << imageVector.at(iterator);
	for (iterator = 1; iterator < imageVector.size(); iterator++)
	{
		*(monteCarlo) << " " << imageVector.at(iterator);
	}
	*(monteCarlo) << "];" << std::endl;
	*(monteCarlo) << "yy" << graphicsCount << " = interp1(x, " << "y" << graphicsCount << ", xq, 'pchip');";
	#endif
	
	labels.push_back(label);
	graphicsCount++;
	
}

void MatlabCoder::setParameters(int option)
{
	
	if (option == EER_ONLY)
	{
		
		addEERFlag = true;
		
	}
	else if (option == FNRXFPR)
	{
		
		FNRXFPRGraph = true;
		
	}
	else if (option == BOTH_EER_FNRXFPR)
	{
		
		addEERFlag = true;
		FNRXFPRGraph = true;
		
	}
	else
	{
		
		std::cout << "Wrong option at matlabCodeEngine's setParameters( option );" << std::endl;
		
	}
	
}

void MatlabCoder::batchMaker(std::string filepath, std::string filename, int batchID)
{
	
	int outter_iterator;
	int inner_iterator;
	std::ofstream *batch;
	batch = new std::ofstream(filepath + filename + ".m", std::ofstream::out);
	
	*(batch) << "function EER = " << filename.c_str() << "()" << std::endl;
	*(batch) << "% Adding paths:" << std::endl;
	*(batch) << "% addpath('";
	for (outter_iterator = 1; outter_iterator < SAMPLES; outter_iterator++)
	{
		if (outter_iterator % 6 == 0)
		{
			*(batch) << "')" << std::endl << "addpath('" << batchID << '/' << outter_iterator << "','";
			continue;
		}
		*(batch) << batchID << '/' << outter_iterator << "','";
	}
	*(batch) << batchID << '/' << outter_iterator << "')" << std::endl << std::endl;

	*(batch) << "% Running Database's Averages:" << std::endl;
	for (outter_iterator = 1; outter_iterator <= ( FINGERS / DATABASE_SIZE ); outter_iterator++)
	{
		*(batch) << "EER{" << outter_iterator << "} = Database" << outter_iterator << "Average();" << std::endl;
	}
	*(batch) << std::endl;

	for (outter_iterator = 1; outter_iterator <= SAMPLES; outter_iterator++)
	{
		*(batch) << "% Running " << outter_iterator << "'th Experiment:" << std::endl;
		for (inner_iterator = 1; inner_iterator <= ( FINGERS / DATABASE_SIZE ); inner_iterator++)
		{
			*(batch) << "% discard = Database" << outter_iterator << "_" << inner_iterator << "();" << std::endl;
		}
		*(batch) << "% discard = Experiment" << outter_iterator << "Average();" << std::endl << std::endl;
	}

	*(batch) << "% Removing paths:" << std::endl;
	*(batch) << "% rmpath('";
	for (outter_iterator = 1; outter_iterator <= SAMPLES - 1; outter_iterator++)
	{
		if (outter_iterator % 6 == 0)
		{
			*(batch) << "')" << std::endl << "rmpath('" << batchID << '/' << outter_iterator << "','";
			continue;
		}
		*(batch) << batchID << '/' << outter_iterator << "','";
	}
	*(batch) << batchID << '/' << outter_iterator << "')" << std::endl << std::endl;
	
	*(batch) << "'Done!'" << std::endl;
	*(batch) << "end";

	batch->close();
	delete batch;
	
}

#ifdef MONTE_CARLO
void MatlabCoder::monteCarloBatchMaker(std::string filepath, std::string filename, int batchID)
{

	int outter_iterator;
	int inner_iterator;
	std::ofstream *batch;
	batch = new std::ofstream(filepath + filename + ".m", std::ofstream::out);

	*(batch) << "function EER = " << filename.c_str() << "()" << std::endl;
	*(batch) << "% Adding paths:" << std::endl;
	*(batch) << "addpath('";
	for (outter_iterator = 1; outter_iterator < SAMPLES; outter_iterator++)
	{
		if (outter_iterator % 6 == 0)
		{
			*(batch) << "')" << std::endl << "addpath('" << batchID << '/' << outter_iterator << "','";
			continue;
		}
		*(batch) << batchID << '/' << outter_iterator << "','";
	}
	*(batch) << batchID << '/' << outter_iterator << "')" << std::endl << std::endl;
	
	for (outter_iterator = 1; outter_iterator <= SAMPLES; outter_iterator++)
	{
		*(batch) << "% Running " << outter_iterator << "'th Experiment:" << std::endl;
		for (inner_iterator = 1; inner_iterator <= (FINGERS / DATABASE_SIZE); inner_iterator++)
		{
			*(batch) << "EER{" << outter_iterator << "}{" << inner_iterator << "} = Database" << outter_iterator << "_" << inner_iterator << "_MC();" << std::endl;
		}
	}
	std::cout << std::endl;
	
	*(batch) << "% Removing paths:" << std::endl;
	*(batch) << "rmpath('";
	for (outter_iterator = 1; outter_iterator <= SAMPLES - 1; outter_iterator++)
	{
		if (outter_iterator % 6 == 0)
		{
			*(batch) << "')" << std::endl << "rmpath('" << batchID << '/' << outter_iterator << "','";
			continue;
		}
		*(batch) << batchID << '/' << outter_iterator << "','";
	}
	*(batch) << batchID << '/' << outter_iterator << "')" << std::endl << std::endl;

	*(batch) << "'Done!'" << std::endl;
	*(batch) << "end";

	batch->close();
	delete batch;

}
#endif

void MatlabCoder::masterMaker(std::string filepath, std::string filename)
{
	
	std::ofstream *batch;
	batch = new std::ofstream(filepath + filename + ".m", std::ofstream::out);
	
	*(batch) << "numDB = " << ( FINGERS / DATABASE_SIZE ) << ";" << std::endl;
	*(batch) << "%numTests = " << SAMPLES << ";" << std::endl;
	*(batch) << "for j = 1:numDB" << std::endl;
	*(batch) << "	databaseBuffer{j} = 0;" << std::endl;
	*(batch) << "end" << std::endl;
	*(batch) << "totalExecutions = " << TOTAL_BATCHES << ";" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "for i = 1:totalExecutions" << std::endl;
	*(batch) << "	addpath(num2str(i));" << std::endl;
	
	*(batch) << "	" << std::endl;
	
	*(batch) << "	currentExecution = runBatch;" << std::endl;
	*(batch) << "	for j = 1:numDB" << std::endl;
	*(batch) << "		databaseBuffer{j} = databaseBuffer{j} + currentExecution{j};" << std::endl;
	*(batch) << "	end" << std::endl;
	
	*(batch) << "	" << std::endl;
	
	*(batch) << "	f{i} = strcat('f', num2str(i));" << std::endl;
	*(batch) << "	mkdir(f{i});" << std::endl;
	
	*(batch) << "	" << std::endl;
	
	*(batch) << "	for j = 1:numDB" << std::endl;
	*(batch) << "		movefile(strcat('Database', num2str(j), 'AverageMain.png'), f{i});" << std::endl;
	*(batch) << "		movefile(strcat('Database', num2str(j), 'AverageFNRxFPR.png'), f{i});" << std::endl;
	*(batch) << "		%for k = 1 : numTests" << std::endl;
	*(batch) << "		%    movefile(strcat('Database', num2str(k), '_', num2str(j), 'Main.png'), f{i});" << std::endl;
	*(batch) << "		%    movefile(strcat('Database', num2str(k), '_', num2str(j), 'FNRxFPR.png'), f{i});" << std::endl;
	*(batch) << "		%    movefile(strcat('Experiment', num2str(k), 'AverageMain.png'), f{i});" << std::endl;
	*(batch) << "		%    movefile(strcat('Experiment', num2str(k), 'AverageFNRxFPR.png'), f{i});" << std::endl;
	*(batch) << "		%end" << std::endl;
	*(batch) << "	end" << std::endl;
	*(batch) << "	movefile(f{i}, 'LaTeX/images/png');" << std::endl;
	
	*(batch) << "	" << std::endl;
	
	*(batch) << "	%clear" << std::endl;
	*(batch) << "	close all;" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "	rmpath(num2str(i));" << std::endl;
	*(batch) << "end" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "for j = 1:numDB" << std::endl;
	*(batch) << "	databaseBuffer{j} = databaseBuffer{j} / totalExecutions;" << std::endl;
	*(batch) << "end" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "fileID = fopen('finalchapter.tex', 'w');" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\chapter{Monte Carlo}\\n');" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\begin{itemize}\\n');" << std::endl;
	*(batch) << "for j = 1:numDB" << std::endl;
	*(batch) << "	fprintf(fileID, '\\\\item ');" << std::endl;
	*(batch) << "	fprintf(fileID, 'Database ');" << std::endl;
	*(batch) << "	fprintf(fileID, num2str(j));" << std::endl;
	*(batch) << "	fprintf(fileID, ': ');" << std::endl;
	*(batch) << "	fprintf(fileID, num2str(databaseBuffer{j}));" << std::endl;
	*(batch) << "	fprintf(fileID, '\\n');" << std::endl;
	*(batch) << "end" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\end{itemize}\\n');" << std::endl;
	*(batch) << "fclose(fileID);" << std::endl;
	*(batch) << "movefile('finalchapter.tex', 'LaTeX/chapters/standard');" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "% Psudocódigo:" << std::endl;
	*(batch) << "% Enquanto houverem pastas :" << std::endl;
	*(batch) << "%   Entra em uma pasta." << std::endl;
	*(batch) << "%	   ->Executa os DatabaseXAverage" << std::endl;
	*(batch) << "%	   ->Move os resultados para \"pasta\"" << std::endl;
	*(batch) << "%   Repete" << std::endl;
	*(batch) << "%   Move todas as pastas para \"LaTeX\\images\\filetype\"" << std::endl;
	
	batch->close();
	delete batch;
	
}

#ifdef MONTE_CARLO
void MatlabCoder::monteCarloMasterMaker(std::string filepath, std::string filename)
{
	
	std::ofstream *batch;
	batch = new std::ofstream(filepath + filename + ".m", std::ofstream::out);
	
	*(batch) << "numDB = " << (FINGERS / DATABASE_SIZE) << ";" << std::endl;
	*(batch) << "numTests = " << SAMPLES << ";" << std::endl;
	*(batch) << "for j = 1:numDB" << std::endl;
	*(batch) << "	databaseBuffer{j} = 0;" << std::endl;
	*(batch) << "end" << std::endl;
	*(batch) << "totalExecutions = " << TOTAL_BATCHES << ";" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "for i = 1:totalExecutions" << std::endl;
	*(batch) << "	addpath(num2str(i));" << std::endl;
	
	*(batch) << "	" << std::endl;

	*(batch) << "	EER{i} = runMonteCarlo;" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "	rmpath(num2str(i));" << std::endl;
	*(batch) << "end" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "for j = 1:numDB" << std::endl;
	*(batch) << "	databaseBuffer{j} = databaseBuffer{j} / totalExecutions;" << std::endl;
	*(batch) << "end" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "fileID = fopen('finalchapter.tex', 'w');" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\chapter{Monte Carlo}\\n');" << std::endl;
	*(batch) << "fprintf(fileID, 'All the EERs:');" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\begin{itemize}\\n');" << std::endl;
	*(batch) << "EERbuffer = 0;" << std::endl;
	*(batch) << "for i = 1:totalExecutions" << std::endl;
	*(batch) << "	for j = 1:numTests" << std::endl;
	*(batch) << "		for k = 1:numDB" << std::endl;
	*(batch) << "			fprintf(fileID, '\\\\item ');" << std::endl;
	*(batch) << "			fprintf(fileID, 'Database ');" << std::endl;
	*(batch) << "			fprintf(fileID, num2str(i));" << std::endl;
	*(batch) << "			fprintf(fileID, '.');" << std::endl;
	*(batch) << "			fprintf(fileID, num2str(j));" << std::endl;
	*(batch) << "			fprintf(fileID, '.');" << std::endl;
	*(batch) << "			fprintf(fileID, num2str(k));" << std::endl;
	*(batch) << "			fprintf(fileID, ': ');" << std::endl;
	*(batch) << "			fprintf(fileID, num2str(EER{i}{j}{k}));" << std::endl;
	*(batch) << "			fprintf(fileID, '\\n');" << std::endl;
	*(batch) << "			" << std::endl;
	*(batch) << "			EERbuffer = EERbuffer + EER{i}{j}{k};" << std::endl;
	*(batch) << "		end" << std::endl;
	*(batch) << "	end" << std::endl;
	*(batch) << "end" << std::endl;
	*(batch) << "fprintf(fileID, '\\\\end{itemize}\\n');" << std::endl;
	*(batch) << "fprintf(fileID, strcat('Final EER: ', num2str( EERbuffer/(totalExecutions * numTests * numDB) ), '\\n'));" << std::endl;
	*(batch) << "fclose(fileID);" << std::endl;
	*(batch) << "movefile('finalchapter.tex', 'LaTeX/chapters/standard');" << std::endl;
	
	*(batch) << std::endl;
	
	*(batch) << "% Psudocódigo:" << std::endl;
	*(batch) << "% Enquanto houverem pastas :" << std::endl;
	*(batch) << "%   Entra em uma pasta." << std::endl;
	*(batch) << "%	   ->Executa os DatabaseXAverage" << std::endl;
	*(batch) << "%	   ->Move os resultados para \"pasta\"" << std::endl;
	*(batch) << "%   Repete" << std::endl;
	*(batch) << "%   Move todas as pastas para \"LaTeX\\images\\filetype\"" << std::endl;
	
	batch->close();
	delete batch;
	
}
#endif

MatlabCoder::MatlabCoder( std::string filepath, std::string filename )
{
	
	graphicsCount = 0;
	addEERFlag = false;
	FNRXFPRGraph = false;
	source = new std::ofstream(filepath + filename + ".m", std::ofstream::out);
	#ifdef MONTE_CARLO
	monteCarlo = new std::ofstream(filepath + filename + "_MC.m", std::ofstream::out);
	#endif
	prefixName = filename;
	
	codeStart();
	
}

MatlabCoder::~MatlabCoder()
{
	
	consummate();
	delete source;
	
}

/*  Sample to generate:
clear;
close all;
x = 0:1000:20000;
y1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 8, 15, 17, 18, 19, 20, 22, 22, 22];
y2 = [0, 0, 0, 0, 1, 2, 5, 11, 12, 18, 20, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24];

figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(x,y1)
title('Falso Positivo (F.A.R.)')

subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(x,y2)       % plot using + markers
title('Falso Negativo (F.R.R.)')

%figure
%subplot(2,1,1)       % add third plot in 2 x 1 grid
%plot(x,y3)
%title('Soma dos EERos Tipo I e II (F.A.R. + F.R.R.)')
close all
figure
xq = 0:0.5:20000;
xx = interp1(x,y1,xq,'spline');
plot(xq,xx,'-','LineWidth',2);
hold
xx2 = interp1(x,y2,xq,'spline');
plot(xq,xx2,'--r','LineWidth',2);
xlabel('Limiar')
ylabel('EERo (%)')
legend('Falso Positivo','Falso Negativo','Location','SouthEast')
grid on

yyy = abs(y2 - y1);
find(yyy==min(yyy))
xxx = abs(xx-xx2);
i = find(xxx==min(xxx))
plot([xq(i) xq(i)], [0 xx2(i)],'k--');
plot([0 xq(i)], [xx2(i) xx2(i)],'k--');
%xx2(i)
axis([0 20000 0 1])

%figure
%cs = csape(y1,y2);
%fnplt(cs,2);
%axis([-1 7 -1.2 1.2])
%hold on
%plot(y1,y2,'o')
%hold off

figure('Color',[1 1 1]);
x = 0:20;
x = x/20
%y = sin(x);
%xx = 0:.25:10;
%yy = spline(x,y2,xx);
%plot(y1,y2,'-',y1,y2, 'LineWidth', 2)
plot(xx2,xx,'-',xx2,xx, 'LineWidth', 2)
hold
%x = x/10;
plot(x, x);
xlabel('Falso Negativo')
ylabel('Falso Positivo')
axis([-0.1 1 -0.1 1])
grid on

%figure
%plot(y1, y2, 'LineWidth', 2);
%hold
%xx2 = interp1(x,x,xq,'spline');
%plot(xq,xx2,'--r','LineWidth',2);
%plot(x, x);
*/