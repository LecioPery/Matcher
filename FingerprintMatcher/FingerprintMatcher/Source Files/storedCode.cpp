/*Finger *firstFinger = new Finger(path + "1_1");
char continueLoop = 'y';
std::cout << std::endl;
float threshold = 0;
int iterator;
std::vector<float> distancesVector;
do
{
	std::cout << "Continue?" << std::endl;
	std::cin >> continueLoop;
	//std::cout << "Value: " << std::endl;

	//std::cin >> threshold;
	while (threshold - 20000)
	{
		std::cout << "threshold: " << threshold << " answer: " << firstFinger->getFalseNegative(threshold) << std::endl;
		threshold = threshold + 2000.00;
	}
	iterator = 0;
	distancesVector = firstFinger->getVector();
	while (iterator < SAMPLES * (SAMPLES - 1) / 2)
	{
		std::cout << distancesVector.at(iterator) << " ";
		iterator++;
	}
	std::cout << std::endl;

} while (continueLoop == 'y');
delete(firstFinger);*/