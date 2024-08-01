namespace Qrng {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Math;
  open Microsoft.Quantum.Measurement;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Intrinsic;

  operation QuantumRandomNumberGenerator() : Int {
    let max = 50;
    Message($"Sampling a random number between 0 and {max}: ");
    return RandomNumberInRange(max);
  }

  operation RandomNumberInRange(max : Int) : Int {
    mutable bits = new Result[0];
    for (indexBit in 1..BitSizeI(max)) {
      set bits += [RandomNumber()];
    }
    let sample = ResultArrayAsInt(bits);
    return sample > max
    ? RandomNumberInRange(max)
    | sample;
  }

  operation RandomNumber() : Result {
    using (q = Qubit()) {
      H(q); // Put qubit to superposition
      let r = M(q);
      Reset(q);
      return r;
    }
  }
}