package.path=package.path .. ";/var/touchelf/scripts/?.lua"
require "base"

function main()
    setup()
    ::start::
    -- 点击某一章 
    local p0 = {1105,515}
    --while getColor(p0[1], p0[2]) ~= 0x371E0F do
    --    mSleep(1000)
    --end
    --click(p0[1], p0[2])
    
    -- 点击探索 
    local p1 = {844,472}
    --while getColor(p1[1], p1[2]) ~= 0xF3B25E do
    --    mSleep(1000)
    --end
    --click(p1[1], p1[2]);
 
    -- 等待进入场景 37,56  ,0xF0F5FB
    local p2 = {37,56}
    --while getColor(p2[1], p2[2]) ~= 0xF0F5FB do
    --    mSleep(1000)
    --end
    
    local count = 0;
    ::find::
    x, y = findImageInRegionFuzzy("/var/touchelf/res/fire.bmp", 40, 1, 180, 1132, 510, 0x000000);
    if x == -1 and y == -1 then
        x, y = findImageInRegionFuzzy("/var/touchelf/res/boss.bmp", 40, 1, 180, 1132, 510, 0x000000);
    end
    -- x, y = findImageFuzzy("/var/touchelf/res/fire.bmp", 50, 0x000000);
    if x ~= -1 and y ~= -1 then
        logDebug('findout')
        touchDown(0, x + math.random(2, 5), y + math.random(2, 5));
        mSleep(math.random(500, 800));
        touchUp(0);
    else
        logDebug('not found')
        if count >= 6 then
            click(p2[1],p2[2])
            clickQuitBen()
            --goto start;
        else
            clickMove(819,150,419,150,100);
            goto find;
        end 
        
    end
    
    -- 检查是否处于战斗状态
    waitUntilBattleOver()
        
    -- 检查是否结束
    local flag = 0
    while getColor(p2[1], p2[2]) ~= 0xF0F5FB do
        flag = 1
        click(p1[1], p1[2])
        mSleep(1000)
    end
    if flag == 1 then
        count = count + 1
    end
    if count >= 6 then
        click(p2[1],p2[2])
        clickQuitBen()
        --goto start;
    else
        goto find;
    end
end