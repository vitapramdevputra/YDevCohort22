integer i = 0;

while (i < 10){
    system.debug('i -> ' + i);
    if(limits.getCpuTime() < 8000){
        break;
    }
}

integer limitCpu = limits.getCpuTime();
integer limitMaxCPU = limits.getLimitCpuTime();
system.debug('limitCPU -> ' + limitCpu);
system.debug('limitMaxCPU -> ' + limitMaxCPU);

system.debug(Limits.getLimitDMLStatements());