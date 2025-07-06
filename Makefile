stackvm.cfg: $(wildcard src/*.m4) $(wildcard src/*.cfg)
	m4 src/header.m4 src/vm.cfg > stackvm.cfg

