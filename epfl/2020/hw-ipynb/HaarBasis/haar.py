"""
Author: phunc20

haar1D and haar2D are slightly modified version of the functions carrying the same names in the notebook.


"""
import math
import numpy as np

def haar1D(n, SIZE):
    # check power of two
    if math.floor(math.log(SIZE) / math.log(2)) != math.log(SIZE) / math.log(2):
        print("Haar defined only for lengths that are a power of two")
        return None
    if n >= SIZE or n < 0:
        print("invalid Haar index")
        return None
    
    # zero basis vector
    if n == 0:
        return np.ones(SIZE)
    
    # express n >= 1 as 2^p + q with p as large as possible;
    # then k = SIZE/2^p is the length of the support
    # and s = qk is the shift
    p = math.floor(math.log(n) / math.log(2))
    pp = int(pow(2, p))
    k = SIZE / pp
    s = (n - pp) * k
    
    h = np.zeros(SIZE)
    h[int(s):int(s+k/2)] = 1
    h[int(s+k/2):int(s+k)] = -1
    # these are not normalized
    return h


def haar2D(n, SIZE=8):
    # get horizontal and vertical indices
    hr = haar1D(n % SIZE, SIZE)
    hv = haar1D(int(n / SIZE), SIZE)
    # 2D Haar basis matrix is separable, so we can
    # just take the column-row product
    H = np.outer(hr, hv)
    H = H / math.sqrt(np.sum(H * H))
    # the previous line just divides H by its Frobenius norm
    # so that the returned value of haar2D() has norm 1.
    return H


def decomposition_step(array):
    h = len(array)
    exponent = math.log(h, 2)
    if math.floor(exponent) != exponent:
        print("Haar defined only for lengths that are a power of two")
        return None
    # =============================================
    #  Implementation 01:
    #  Same as in the paper, only diff being
    #  1-based to 0-based.
    # =============================================
    #array2 = np.empty_like(array)
    array2 = [0]*h
    for i in range(h//2):
        array2[i] = (array[2*i] + array[2*i+1]) / math.sqrt(2)
        array2[h//2 + i] = (array[2*i] - array[2*i+1]) / math.sqrt(2)
    # =============================================
    #  Implementation 02:
    #  Try to code using matrix operation instead
    # =============================================
    #if not isinstance(array):
    #    array = np.array(array)
    return array2


if __name__ == "__main__":
    print(f"decomposition_step([9,7,3,5]) = {decomposition_step([9,7,3,5])}")
