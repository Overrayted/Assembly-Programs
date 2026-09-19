# ARM7 UPC Verifier

An ARM7 assembly implementation of the UPC-A
check-digit algorithm.

## Concepts
- ARM7 assembly
- Register manipulation
- Conditional execution
- Memory addressing
- ASCII conversion
- Bitwise operations

## Algorithm
1. Separate odd/even digits
2. Multiply odd-position sum by 3
3. Add even-position digits
4. Add check digit
5. Test divisibility by 10
