#ifndef COMMON_CONSTANTS__
#define COMMON_CONSTANTS__

#define INPUT_PATH "Resource Files/Input/"
#define OUTPUT_PATH "Resource Files/Output/"

/* Avise ao programa que essas constantes s�o o que modela o banco de dados: */
#define SAMPLES 5
#define FINGERS 80
#define DATABASE_SIZE 20

/* Avise as constantes que modelam o tamanho de um finger code e quantos angulos foram usados no filtro de Gabor: */
#define FINGERCODE_AMOUNT 8
#define FINGERCODE_LENGTH 3200

/*
 * A quantidade de threshold que v�o ser testados para montar os gr�ficos de FNR e ERR.
 * MAX � o maior poss�vel. Step � "de quanto em quanto" ele avan�ar�.
 */
#define MAX_THRESHOLD 60000
#define STEP_THRESHOLD 2000

/*
 * Todas as compara��es das colunas s�o feitas para calcular o FNR.
 * As apenas una linha, escolhida a baixo, � utilizada para calcular o FPR.
 */
//#define FPR_LINE 4

/*
 * 0 seria como abrir os diret�rios em modo r, 1 em modo w.
 */
#define FORCE_DIR 1

/* Modo de opera��o do script */
#define MONTE_CARLO
#define TOTAL_BATCHES 100

#endif
