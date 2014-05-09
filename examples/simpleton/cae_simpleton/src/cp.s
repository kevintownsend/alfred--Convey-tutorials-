	.file	"cp.s"
	.ctext

# See Convey Reference Manual for documentation on assembly instructions
# These two instruction only use AE0.  You can execute an instruction using
# the AEM (mask register) by omitting the ".AE0" extension.




	.globl	cpInc
	.type	cpInc. @function
	.signature	pdk=65100

# cpInc function:
#   - Writes AEG0 with value on AE0
# 	- Calls caep00 to execute increment on value
#	- Returns value through a8

cpInc:
	mov.AE0 %a8, $0, %aeg
	caep00.AE0 $0
	mov.AE0 %aeg, $0, %a8
	rtn 
	
	
	


	.globl	cpIncMem
	.type	cpIncMem. @function
	.signature	pdk=65100

# cpInc function:
#   - Writes AEG0 on AE0 with address
# 	- Calls caep01 to execute increment on address
#	- Returns nothing

cpIncMem:
	mov.AE0 %a8, $0, %aeg
	caep01.AE0 $0
	rtn 
	
		
		
		
	
	.cend
