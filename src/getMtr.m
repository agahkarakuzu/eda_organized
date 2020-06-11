function mtr = getMtr(mtOn,mtOff)

% Simple formula for MTR calculation
mtr = 100 * (mtOff - mtOn)./mtOff;

% Zero out unrealistic values.
mtr(isnan(mtr)) = 0;
mtr(isinf(mtr)) = 0;


end