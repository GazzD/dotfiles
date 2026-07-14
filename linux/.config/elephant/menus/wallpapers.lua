-- Wallpaper picker for Walker / Elephant
-- Scans wallpaper directories and applies them with awww

Name = "wallpapers"
NamePretty = "Wallpapers"
Icon = "image-x-generic"
Cache = true
-- Action = "echo 111"
-- Action = "matugen image '%VALUE%'"
-- Action = "awww img --transition-type grow --transition-pos any '%VALUE%'"
Action = "awww img --transition-type any '%VALUE%'"


-- Directories to scan (add your own paths here)
local dirs = {
    "/usr/share/wallpapers/cachyos-wallpapers",
    os.getenv("HOME") .. "/Pictures/Wallpapers",
}

-- File extensions to include
local extensions = { "jpg", "jpeg", "png", "webp", "gif" }

local function build_find_cmd(dir)
    local ext_parts = {}
    for i, ext in ipairs(extensions) do
        if i > 1 then
            table.insert(ext_parts, "-o")
        end
        table.insert(ext_parts, "-iname")
        table.insert(ext_parts, '"*.' .. ext .. '"')
    end
    return "find '" .. dir .. "' -maxdepth 2 -type f \\( " .. table.concat(ext_parts, " ") .. " \\) 2>/dev/null | sort"
end

function GetEntries()
    local entries = {}

    for _, dir in ipairs(dirs) do
        -- Skip directories that don't exist
        local check = io.popen("test -d '" .. dir .. "' && echo yes")
        if check then
            local exists = check:read("*l")
            check:close()

            if exists == "yes" then
                local handle = io.popen(build_find_cmd(dir))
                if handle then
                    for filepath in handle:lines() do
                        local filename = filepath:match("([^/]+)$")
                        local name_no_ext = filename:match("^(.+)%.[^%.]+$") or filename

                        table.insert(entries, {
                            Text = name_no_ext,
                            Value = filepath,
                            Icon = filepath, -- uses the image file itself as thumbnail
                            Preview = filepath,
                            PreviewType = "file",
                        })
                    end
                    handle:close()
                end
            end
        end
    end

    return entries
end
