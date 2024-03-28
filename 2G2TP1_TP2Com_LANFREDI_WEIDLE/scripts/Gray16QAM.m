function mGray = Gray16QAM()
mGray = ["0" "1"];
mGray = ["0"+mGray, "1"+flip(mGray)];
mGray = ["0"+mGray; "1"+mGray];
mGray= ["0"+mGray; "1"+flip(mGray)];

mGray = bin2dec(mGray);
end 