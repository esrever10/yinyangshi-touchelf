package.path=package.path .. ";/var/touchelf/scripts/?.lua"
require "base"

function main()
    setup()
    
    -- 点击 挑战 按钮
    local p0 = {879,478}
    click(p0[1], p0[2]);
        
    -- 点击 准备 按钮
    clickReady()

    -- 检查是否处于战斗状态
    waitUntilBattleOver()
        
    -- 检查是否结束
    while getColor(p0[1], p0[2]) ~= 0xF3B25E do
        click(p0[1], p0[2]);
        mSleep(500)
    end

end