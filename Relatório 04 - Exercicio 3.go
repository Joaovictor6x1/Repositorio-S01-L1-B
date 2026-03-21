package main

import "fmt"

// função fibonacci
func fibonacci(n int) {
	a := 0
	b := 1

	for i := 0; i < n; i++ {
		fmt.Print(a, " ")
		prox := a + b
		a = b
		b = prox
	}
}

func main() {
	var n int

	fmt.Print("Quantos números da sequência você quer? ")
	fmt.Scan(&n)

	fibonacci(n)
}
