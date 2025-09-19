# Stack Based Virtual Machine

## Building the VM Script:
[GNU m4](https://www.gnu.org/software/m4/m4.html) is required to generate the VM console script. A makefile is also
included that provides the recipe to compile the VM script.

## Examples
See stackvm-xonotic/examples, for example programs.
To test the program included in the example folder, do the following:
 - Make sure the xSVM program is loaded, do this by executing stackvm.cfg.
 - Execute the program to run, in this example do "exec stackvm-xonotic/examples/main.cfg" to load main.cfg
 - Use the "vm.run" alias to initiate program execution.

### About programs in examples folder
 - mainloader.cfg: Sits at the top of the program, loads the main function.
 - math.cfg: Primitive math library containing basic functions.
 - main.cfg: Example program that tests math.cfg functionality.

## Suggested Reads
 - [Xonotic Console Tips and tricks](https://forums.xonotic.org/showthread.php?tid=2987)
 - [Xonotic rpn quakec source](https://gitlab.com/xonotic/xonotic-data.pk3dir/-/blob/master/qcsrc/common/command/rpn.qc)
 - [Stack Machine on Wikipedia](https://en.wikipedia.org/wiki/Stack_machine)
 - [Stack Based Virtual Machine written in Java](https://andreabergia.com/series/stack-based-virtual-machines/)
