#include <math.h>
double cVarianza(double *arreglo, int N) {
	int i = 0;
	double media=0,sumatoria=0;
	for(i=0; i<N; i++){
		media = media + arreglo[i];
	}
	media = media/N;
	for ( i = 0; i < N; i++){
		sumatoria = sumatoria + pow((arreglo[i]-media),2);
	}
	return (sumatoria/N);
}
