/* This program will do a matrix addition on two matrices A and B.
They have the same dimension N (rows) x M (cols) where
N is 2048 and M is 1024.

+---------+   +---------+   +---------+
|000000000|   |111111111|   |111111111|
|111111111| + |222222222| = |333333333|
|222222222|   |333333333|   |555555555|
+---------+   +---------+   +---------+
matrixA       matrixB

matrixA   = column number starting at 0
matrixB   = column number + 1 starting at 0

Implement a 2D Grid-Stride-Loop:
https://developer.nvidia.com/blog/cuda-pro-tip-write-flexible-kernels-grid-stride-loops/
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#include <cmath>
#include <stdio.h>

using namespace std;


/* This is our CUDA call wrapper, we will use in PAC.
*
*  Almost all CUDA calls should be wrapped with this makro.
*  Errors from these calls will be catched and printed on the console.
*  If an error appears, the program will terminate.
*
* Example: gpuErrCheck(cudaMalloc(&deviceA, N * sizeof(int)));
*          gpuErrCheck(cudaMemcpy(deviceA, hostA, N * sizeof(int), cudaMemcpyHostToDevice));
*/
#define gpuErrCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char* file, int line, bool abort = true)
{
    if (code != cudaSuccess)
    {
        std::cout << "GPUassert: " << cudaGetErrorString(code) << " " << file << " " << line << std::endl;
        if (abort)
        {
            exit(code);
        }
    }
}


// Compare results
int compareResultVec(int* matCPU, int* matGPU, int size)
{
    int error = 0;
    for (int i = 0; i < size; i++)
    {
        error += abs(matCPU[i] - matGPU[i]);
    }
    if (error == 0)
    {
        cout << "No errors. All good!" << endl;
        return 0;
    }
    else
    {
        cout << "Accumulated error: " << error << endl;
        return -1;
    }
}


void main(void)
{
    // Define the size of the matrix: M=1024 and N=2048
    const int M = 1 << 10;
    const int N = M << 1;

    //Please implement me
}
