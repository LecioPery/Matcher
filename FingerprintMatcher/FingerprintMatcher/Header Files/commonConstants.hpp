#ifndef COMMON_CONSTANTS__
#define COMMON_CONSTANTS__

#define INPUT_PATH "Resource Files/Input/"
#define OUTPUT_PATH "Resource Files/Output/"

/* Avise ao programa que essas constantes são o que modela o banco de dados: */
#define SAMPLES 5
#define FINGERS 80
#define DATABASE_SIZE 20

/* Avise as constantes que modelam o tamanho de um finger code e quantos angulos foram usados no filtro de Gabor: */
#define FINGERCODE_AMOUNT 8
#define FINGERCODE_LENGTH 3200

/*
 * A quantidade de threshold que vão ser testados para montar os gráficos de FNR e ERR.
 * MAX é o maior possível. Step é "de quanto em quanto" ele avançará.
 */
#define MAX_THRESHOLD 60000
#define STEP_THRESHOLD 2000

/*
 * Todas as comparações das colunas são feitas para calcular o FNR.
 * As apenas una linha, escolhida a baixo, é utilizada para calcular o FPR.
 */
//#define FPR_LINE 4

/*
 * 0 seria como abrir os diretórios em modo r, 1 em modo w.
 */
#define FORCE_DIR 1

/* Modo de operação do script */
#define MONTE_CARLO
#define TOTAL_BATCHES 100

#endif
