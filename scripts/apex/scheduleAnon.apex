//start job everyday 1 PM.
string crn = '0 0 13 * * ?';
ScheduleAccountUpdate su = new ScheduleAccountUpdate();

id jobid = system.schedule('AccountUpdateCron', crn, su);
system.debug(jobid);