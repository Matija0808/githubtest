import numpy as np
import matplotlib.pyplot as plt
import statistics

p = 0.7
rng = np.random.default_rng(42)
arr = np.zeros(10000)
for i in range(10000):
    x = rng.random()
    arr[i] = 1 if x < p else 0

print(f"E(x) = {np.mean(arr)}")
print(f"var(x) = {np.var(arr)}")
print(p*(1-p))

