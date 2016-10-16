package.path=package.path .. ";/var/touchelf/scripts/?.lua"
require "base"

function main()
    setup()
    -- 点击 挑战 按钮
    local p0 = {573,478}
    -- click(p0[1], p0[2]);
    
    -- 创建队伍
    -- clickCreateTeam()
        
    -- 确认创建队伍
    -- clickSureToCreateTeam()
        
    ::startFire::
    -- 开始战斗
    clickTeamFire()
        
    -- 点击 准备 按钮
    clickReady()
    
    -- 检查是否处于战斗状态
    waitUntilBattleOver()
        
    -- 检查是否结束
    local p1 = {668,381}
    while getColor(p1[1], p1[2]) ~= 0xF3B25E do
        click(p0[1], p0[2]);
        mSleep(500)
    end
    click(p1[1], p1[2]);
    goto startFire
end