#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pci/pci.h>

int main() {
	const char *tool_bin = "./tool-1";
	printf("Hello from the test-1 binary, PCI_LIB_VERSION: %x\n", PCI_LIB_VERSION);
	printf("Calling binary %s\n", tool_bin);
	int _ret = execl(tool_bin, tool_bin, NULL);
	perror("ERROR: execl failed");
	return 1;
}
