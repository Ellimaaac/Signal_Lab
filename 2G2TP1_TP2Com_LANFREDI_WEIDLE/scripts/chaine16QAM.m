function [signalBits, signalReceivedBits, signalSymbols, signalReceived, signalSymbolesReceivedCor] = chaine16QAM(N, variance)
    signalBits = genBin(N);
    signalSymbols = mappingGray(signalBits);
    signalReceived = canalAWGN(signalSymbols, variance);
    signalReceivedBits = demapGray(signalReceived);
    signalSymbolesReceivedCor = mappingGray(signalReceivedBits);
end
