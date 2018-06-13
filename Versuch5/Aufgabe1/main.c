/* Umwandlung von Fahrenheit in Celsius fuer fahr = 0, 20, …., 300 */

long celsius;

long fahr2cels (int fahr){
return 5 * (fahr-32) / 9;
}

void main(void) {     
	long fahr;     
	long lower, upper,step;     

	lower = 0;     
	upper = 300;     
	step = 20;     

	fahr = lower;     

	while (fahr <= upper) {         
		fahr2cels (fahr);
	//	celsius = 5 * (fahr-32) / 9; 	//Diese Zeile kommt in c) in Function         
		fahr = fahr + step;     
	} 
} 