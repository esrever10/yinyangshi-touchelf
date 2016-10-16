package.path=package.path .. ";/var/touchelf/scripts/?.lua"
require "base"

function main()
    setup()
    
    x1 = 325 
    x2 = 615
    x3 = 905
    y1 = 130
    y2 = 235
    y3 = 340
    checkPoints = {
        { x1,y1 },
        { x1,y2 },
        { x1,y3 },
        { x2,y1 },
        { x2,y2 },
        { x2,y3 },
        { x3,y1 },
        { x3,y2 },
        { x3,y3 },
    }

    for i=1, 9 do
        p = checkPoints[i]
        if getColor(p[1], p[2]) == 0xCBC0B4 then
            -- 点击开始按钮
            click(p[1], p[2])
            click(p[1], p[2]+90)
            
            -- 点击 准备 按钮
            clickReady()
            
            -- 检查是否处于战斗状态
            waitUntilBattleOver()
            
            -- 检查是否结束
            p0 = {277,549}
            while getColor(p0[1], p0[2]) ~= 0xF3B25E do
                click(p0[1], p0[2]);
                mSleep(500)
            end
        end
    end
    
end