-- 初始化配置
function setup()
    math.randomseed(tostring(os.time()):sub(5):reverse());
    mSleep(1000)
    rotateScreen(90)
end


-- 点击
function click(x, y)
    touchDown(0, x + math.random(-5, 5), y + math.random(-5, 5));
    mSleep(math.random(500, 800));
    touchUp(0);
end

-- 点击准备按钮
function clickReady()
    local p = {1034,461}
    while getColor(p[1], p[2]) ~= 0xD6B589 do
        mSleep(500)
    end
    click(p[1], p[2])
end

-- 点击创建队伍
function clickCreateTeam()
    local p = {943,532}
    while getColor(p[1], p[2]) ~= 0xF3B25E do
        mSleep(500)
    end
    click(p[1], p[2])
end

-- 点击确认创建队伍
function clickSureToCreateTeam()
    local p = {778,510}
    while getColor(p[1], p[2]) ~= 0xF3B25E do
        mSleep(500)
    end
    click(p[1], p[2])
end

-- 点击开始组队战斗
function clickTeamFire()
    local p0 = {869,529}
    local p1 = {800,256}
    while getColor(p0[1], p0[2]) ~= 0xF3B25E or getColor(p1[1], p1[2]) ~= 0xCEC6BC do
        mSleep(500)
    end
    click(p0[1], p0[2])
end

-- 退出探索
function clickQuitBen()
    local p = {689,358}
    while getColor(p[1], p[2]) ~= 0xF3B25E do
        mSleep(500)
    end
    click(p[1], p[2])
end

-- 等到战斗结束
function waitUntilBattleOver(handler)
    local p = {1130,53}
    logDebug(getColor(p[1], p[2]))
    while getColor(p[1], p[2]) == 0xF1B547 do
        handler()
        mSleep(1000)
    end
    logDebug('战斗结束')
end

-- 滑动
function clickMove(x1,y1,x2,y2,n)
    local w = math.abs(x2-x1);
    local h = math.abs(y2-y1);
    touchDown(0,x1,y1);
    mSleep(50);
    if x1 < x2 then
        w1 = n; 
    else
        w1 = -n;
    end
    if y1 < y2 then
        h1 = n; 
    else
        h1 = -n;
    end
    if w >= h then
        for i = 1 , w,n do 
            x1 = x1 + w1;
            if y1 == y2 then
            else
                y1 = y1 + math.ceil(h*h1/w);
            end
            touchMove(0,x1,y1);
            mSleep(10);
        end
    else
        for i = 1 ,h,n do 
            y1 = y1 + h1;
            if x1 ==x2 then
            else
                x1 = x1 + math.ceil(w*w1/h);
            end
            touchMove(0,x1,y1);
            mSleep(10);
        end
    end
    mSleep(50);
    touchUp(0);
end