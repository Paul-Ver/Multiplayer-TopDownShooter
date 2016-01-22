var i = chatListLength-1;
repeat(chatListLength){
 chatList[i+1] = chatList[i];
 i--;
}
chatList[0] = argument[0];
chatAlpha=1;
alarm[11] = chatAlphaFirstDecreaseTime;