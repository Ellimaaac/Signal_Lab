function SymbolsNoised = canalAWGN(Symbols, variance)

 bruitReal = sqrt(variance) * randn(1, length(Symbols));

 bruitComplex = j * sqrt(variance) * randn(1, length(Symbols));
 
 SymbolsNoised = Symbols + bruitReal + bruitComplex;
 
end 