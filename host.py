import qsharp

# from Qrng import QuantumRandomNumberGenerator
# from Bell import RunTest
from Quantum.QB4 import QB4Run

# result = QuantumRandomNumberGenerator.simulate()
# print(result)
# print("result")

# print(RunTest.simulate())

result = QB4Run.simulate()
print(result)
# for r in result:
#     print(r / 10000, end="\n")

print("Done")
