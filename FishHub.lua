local function XOR(text, key)
    local out = {}

    for i = 1, #text do
        local a = string.byte(text, i)
        local b = string.byte(key, ((i - 1) % #key) + 1)

        out[i] = string.char(bit32.bxor(a, b))
    end

    return table.concat(out)
end

--------------------------------------------------
-- Chuỗi ví dụ
--------------------------------------------------

local url = "https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/Loading.lua"
local key = "CACHUOIHUB"

--------------------------------------------------
-- Mã hóa
--------------------------------------------------

local encrypted = XOR(url, key)

--------------------------------------------------
-- Lưu thành mảng số
--------------------------------------------------

local data = {
	43, 53, 55, 56, 38, 117, 102, 103, 39, 35, 52, 111, 36, 33, 33, 39,
	60, 42, 32, 49, 38, 51, 32, 39, 59, 59, 44, 38, 33, 108, 32, 46,
	46, 103, 22, 46, 42, 32, 32, 45, 42, 47, 38, 103, 17, 7, 5, 103,
	39, 39, 37, 50, 108, 32, 48, 46, 45, 59, 122, 47, 34, 40, 45, 103,
	25, 32, 40, 44, 60, 44, 36, 111, 47, 61, 52
}

--------------------------------------------------
-- Khôi phục từ mảng số
--------------------------------------------------

local chars = {}

for i = 1, #data do
    chars[i] = string.char(data[i])
end

local encryptedAgain = table.concat(chars)

--------------------------------------------------
-- Giải mã
--------------------------------------------------

local original = XOR(encryptedAgain, key)

print("Original:")
print(original)
