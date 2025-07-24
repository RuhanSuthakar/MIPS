import zipfile
import sys

expectedFiles = {
    'count_alternating_bits.asm', 
    'mem_acc.asm', 
    'mips1.asm', 
    'mult_add.asm', 
    'prime_detector.asm', 
    'reverse_array.asm',
    'stack_usage.asm'
}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Error: please pass the path to the submission zip file as the only command line argument!")
        exit(1)
    z = zipfile.ZipFile(sys.argv[1])
    zipFileNames = z.namelist()
    
    goodFlag = True
    for name in expectedFiles:
        if name not in zipFileNames:
            print(f"File {name} missing from submission zip, if you submit this zip, you will not be given marks for this file/task")
            goodFlag = False
    
    if goodFlag:
        print("Structure correct!")