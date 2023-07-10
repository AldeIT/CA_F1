# Computer Architecture -- Formula One

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)


## Description

The program can be divided into 4 phases:
   1. Pilot ID search
   2. Collection of monitored data from the input file
   3. Processing of collected data
   4. Printing to the output file

The program starts by searching for the pilot ID, and if it is not found, it invokes the 'Invalid' label. This label will print the error to the output file, and the program will terminate.

If the pilot ID is found, the program begins analyzing each line, first verifying that the data corresponds to the indicated pilot. If it matches, the measurements are extracted and compared with previously recorded maximum values. The output file will contain the corresponding ranges to which the measurements belong.

After checking all lines of the input file, the last line containing all the recorded maximum values and the average speed will be printed to the output file. Additionally, a newline character will be added, even in the case of an incorrect pilot ID.

## Development Team
- Aldegheri Alessandro
- Venturi Davide
- Zerman Nicolò

This project was developed as the final project for our Computer Architecture class at University of Verona.

## Technology Stack
- Assembly
- C

## Design Choices

### File Input and Output Management

When the "telemetry" function is called from the main in the .c file, the addresses of the input and output files are present in the stack. The first thing done is to load these addresses into the %esi and %edi registers, respectively. From that point onwards, these registers represent our input and output files.

To keep track of the current index, the %ecx and %ebx registers are used as counters for the input and output files for most of the program. If they were needed for other operations, their values were saved on the stack.

### Output Writing Management

The output file is written line by line, and whenever there is a match between the pilot ID and the line ID, information is added. To save lines and improve code readability, common outputs (LOW, MEDIUM, HIGH, comma, newline) are printed using procedures.

Once the input file is processed, calculations are performed, and the final output line is printed. This line consists of numbers stored in variables of type ".long". To correctly print these numbers to the output file, an "itoa" function was created. It doesn't convert the number to a string but prints it correctly to the output file.

### Transition from Main to Telemetry Function

In addition to managing the input and output file addresses, to properly connect the main and the function, the content of the general-purpose registers at the time of the function call needed to be saved in the stack and then retrieved just before the return instruction.

### Debugger Usage

In case of issues or errors, a debugger was used, specifically "gdb". The most frequently used functions were breakpoints, step-by-step execution, and variable/register value display.

### Makefile

As required by the assignment, a Makefile was used for the compilation of all files. It includes four different targets:
- **all**: performs a complete compilation.
- **obj**: handles the creation of object files inside the "obj" folder.
- **exec**: creates the final executable inside the "bin" folder.
- **clean**: deletes the contents of the "obj" and "bin" folders.




