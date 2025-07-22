local arg1 = { ... }
local default = ""
local textScale = 1
if pocket then
    if #arg1 > 0 then
        term.clear()
        term.setCursorPos(1,1)
        shell.run("youcube --lp --sh --nv "..table.concat(arg1, " "))
    elseif default ~= "" then
        shell.run("youcube --lp --sh --nv "..default)
    else
        print("Usage:")
        print("play <youtube link>")
        print("play <youtube search terms>")
    end
elseif #arg1 > 0 then
    m = peripheral.find(arg1[1])
    if not m or peripheral.getType(m) ~= "monitor" then
        error(arg1[1] .. " is not a valid monitor name.")
    end
    table.remove(arg1, 1)
    m.setTextScale(textScale)
    if arg1 > 0 then
        shell.run("monitor right youcube "..table.concat(arg1, " "))
    else default ~= "" then
        shell.run("monitor right youcube "..default)
    else
        print("Usage:")
        print("play <monitor name> <youtube link>")
        print("play <monitor name> <youtube search terms>")
    end
end
