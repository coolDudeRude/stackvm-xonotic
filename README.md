# Stack Based Virtual Machine

## Building

Requires [GNU m4](https://www.gnu.org/software/m4/m4.html)

To build the script, simply run `make` in the project directory:

```bash
git clone https://github.com/coolDudeRude/stackvm-xonotic
cd stackvm-xonotic && make
```

## Examples

Some sample programs are included in the [examples folder](./examples).
These use `DPI` (Dynamic Programming Interface). This allows users to write
programs in game. However it can be very slow. There is also an assembler
for the virtual machine (See: [vasm](https://github.com/coolDudeRude/vasm))

### About programs in examples folder

- `mainloader.cfg`: Sits at the top of the program, loads the main function.
- `math.cfg`: Primitive math library containing basic functions.
- `main.cfg`: Example program that tests `math.cfg` functionality.

### Running the example program

First copy the `examples` folder and `stackvm.cfg` script to your [userdir](https://xonotic.org/faq/#config). Then run these command in Xonotic's console:

```
// This should load the vm and the example program
exec stackvm.cfg
exec examples/main.cfg
```

To start program execution run:

```
vm.run
```

## Debugging

There is no proper debugging interface yet, but you can combine `vm.step` with the aliases defined below to debug your scripts.

Use `vm.step` to step through each instruction and use peek and poke aliases to retrieve and change values of local and global variables.

```
// Retrieve local and global variable value
alias peek_l "load_l \"${1 !}\"; dot"
alias peek_g "load_g \"${1 !}\"; dot"

// Set local and global variable value
alias poke_l "push \"${2 !}\"; store_l \"${1 !}\"; echo \"${1} <- ${2}\""
alias poke_g "push \"${2 !}\"; store_g \"${1 !}\"; echo \"${1} <- ${2}\""
```

## Suggested Reads

- [Xonotic Console Tips and tricks](https://forums.xonotic.org/showthread.php?tid=2987)
- [Xonotic rpn quakec source](https://gitlab.com/xonotic/xonotic-data.pk3dir/-/blob/master/qcsrc/common/command/rpn.qc)
- [Stack Machine on Wikipedia](https://en.wikipedia.org/wiki/Stack_machine)
- [Stack Based Virtual Machine written in Java](https://andreabergia.com/series/stack-based-virtual-machines/)
