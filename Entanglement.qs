namespace Bell {
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Intrinsic;

  operation SetQubitState(desired  : Result, q1 : Qubit) : Unit {
    if (desired != M(q1)) {
      X(q1);
    }
  }

  operation RunTest() : ((Int, Int), (Int, Int)) {
     let one = TestBellState(10000, One);
    let zero =  TestBellState(10000, Zero);
    return (zero, one);
  }

  operation TestBellState(count : Int, initial : Result) : (Int, Int) {
    mutable numOnes = 0;
    using (qubit = Qubit()) {
      for (test in 1..count) {
        SetQubitState(initial, qubit);
        let res = M(qubit);

        if (res == One) {
          set numOnes += 1;
        }
      }

      SetQubitState(Zero, qubit);
    }

    let zeros = count - numOnes;
    Message($"{initial} test results ({zeros}, {numOnes}): ");
    return (zeros, numOnes);
  }
}