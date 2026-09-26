‎local URL = "https://raw.githubusercontent.com/windedness/df1nd/refs/heads/main/script.lua"
‎local TAG = "[DF1ND]"
‎
‎print(TAG .. " Initializing loader...")
‎
‎local ok, code = pcall(function()
‎	return game:HttpGet(URL)
‎end)
‎
‎if not ok then
‎	warn(TAG .. " Failed to connect to GitHub: " .. tostring(code))
‎	return
‎end
‎
‎if not code or #code < 10 then
‎	warn(TAG .. " Empty response from server")
‎	return
‎end
‎
‎if string.find(code, "<html", 1, true) or string.find(code, "Bad Gateway", 1, true) then
‎	warn(TAG .. " 502 Bad Gateway — GitHub is down orr blocked")
‎	warn(TAG .. " Try using a VPN or mirror")
‎	return
‎end
‎
‎if string.find(code, "404: Not Found", 1, true) then
‎	warn(TAG .. " 404 Not Found — check the URL")
‎	return
‎end
‎
‎print(TAG .. " Script downloaded (" .. #code .. " bytes)")
‎
‎local func, err = loadstring(code)
‎if not func then
‎	warn(TAG .. " Compilation error: " .. tostring(err))
‎	return
‎end
‎
‎print(TAG .. " Script successfully compiled")
‎
‎local success, runErr = pcall(func)
‎if not success then
‎	warn(TAG .. " Runtime error: " .. tostring(runErr))
‎	return
‎end
‎
‎print(TAG .. " Script successfully loaded")
‎print(TAG .. " Enjoy! — by df1nd")
