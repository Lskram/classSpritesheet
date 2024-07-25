# 🕹️ การเคลื่อนไหวของตัวละครในเกมด้วย anim8 และ Love2D 🎮

โค้ดนี้เป็นสคริปต์ภาษา Lua สำหรับการสร้างการเคลื่อนไหวของตัวละครในเกม โดยใช้กรอบงาน Love2D และไลบรารี anim8 ด้านล่างนี้เราจะอธิบายแต่ละส่วนของโค้ดและการทำงานของมันอย่างละเอียด

## การแบ่งโค้ดและอธิบาย 📜

### การนำเข้าไลบรารี

```lua
local anim8 = require "libs.anim8"
```

- `anim8` เป็นไลบรารีที่ใช้สำหรับสร้างการเคลื่อนไหวในเกม เรานำเข้าไลบรารีนี้มาใช้งานโดยใช้คำสั่ง `require`

### การสร้างตัวละคร

```lua
player = {
    x = 100,
    y = 100,
    speed = 200,
    image = love.graphics.newImage("assets/images/sword.png"),
    state = {}
}
```

- `player` เป็นตารางที่เก็บข้อมูลเกี่ยวกับตัวละครในเกม รวมถึงตำแหน่ง (`x`, `y`), ความเร็ว (`speed`), รูปภาพ (`image`) และสถานะของการเคลื่อนไหว (`state`)

### การกำหนดกริดและสร้างการเคลื่อนไหว

```lua
local g = anim8.newGrid(64, 64, player.image:getWidth(), player.image:getHeight())
player.state.Idel = anim8.newAnimation(g('1-4', 1), 0.1)
player.state.Run = anim8.newAnimation(g('1-4', 2), 0.1)
player.state.Attack = anim8.newAnimation(g('1-4', 3), 0.1)
player.state.Defense = anim8.newAnimation(g('1-4', 4), 0.1)
```

- `g` เป็นกริดที่กำหนดขนาดของแต่ละเฟรม (64x64 พิกเซล) ในรูปภาพของตัวละคร
- `player.state.Idel`, `player.state.Run`, `player.state.Attack`, และ `player.state.Defense` เป็นการสร้างการเคลื่อนไหวในสถานะต่าง ๆ โดยแต่ละสถานะจะมีเฟรมและระยะเวลาต่างกัน

### การเริ่มต้นเกม

```lua
function love.load()
    currAnim = player.state.Idel
end
```

- ฟังก์ชัน `love.load` ถูกเรียกครั้งแรกเมื่อเกมเริ่มต้น ในที่นี้เราเริ่มต้นด้วยการเคลื่อนไหวในสถานะ "Idel"

### การอัปเดตสถานะของตัวละคร

```lua
function love.update(dt)
    if love.keyboard.isDown("left") then
        currAnim = player.state.Run
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        currAnim = player.state.Run
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("up") then
        currAnim = player.state.Run
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("down") then
        currAnim = player.state.Run
        player.y = player.y + player.speed * dt
    elseif love.keyboard.isDown("space") then
        currAnim = player.state.Attack
    elseif love.keyboard.isDown("z") then
        currAnim = player.state.Defense
    else 
        currAnim = player.state.Idel
    end

    currAnim:update(dt)
end
```

- ฟังก์ชัน `love.update` ถูกเรียกอย่างต่อเนื่องเพื่ออัปเดตสถานะของเกม
- ตรวจสอบการกดปุ่มลูกศรเพื่อเปลี่ยนสถานะของการเคลื่อนไหว (เช่น วิ่ง, โจมตี, ป้องกัน) และอัปเดตตำแหน่งของตัวละคร
- อัปเดตการเคลื่อนไหวในปัจจุบัน (`currAnim`) ตามการกดปุ่ม

### การวาดตัวละคร

```lua
function love.draw()
    currAnim:draw(player.image, player.x, player.y)
end
```

- ฟังก์ชัน `love.draw` ถูกเรียกเพื่อวาดตัวละครในเกม โดยใช้การเคลื่อนไหวในปัจจุบัน (`currAnim`) และตำแหน่งของตัวละคร (`player.x`, `player.y`)

## สรุป 🎯

โค้ดนี้เป็นการตั้งค่าเบื้องต้นสำหรับการเคลื่อนไหวของตัวละครในเกม โดยใช้ Love2D และ anim8 ไลบรารี ซึ่งรวมถึงการโหลดรูปภาพ การตั้งค่ากริดและการเคลื่อนไหว การตรวจสอบการกดปุ่มและการเปลี่ยนสถานะของการเคลื่อนไหว และการวาดตัวละครบนหน้าจอเกม

✨ สนุกกับการพัฒนาเกมของคุณ! ✨
