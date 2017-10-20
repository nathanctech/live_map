
local url = "https://gist.githubusercontent.com/TGRHavoc/581ec66730b7abafe49ab616db87b0bb/raw/f27c6f2573dd1df0692f97c78a73f5687d20f791/live_map.versions"
local version = "2.1.4"
local latest = true

function checkForUpdate()
    PerformHttpRequest(url, function(err, data, headers)
        local parsed = json.decode(data)

        if (parsed["resource"] ~= version) then
            print("|===================================================|")
            print("|             Live Map Update Available             |")
            print("| Download at: https://github.com/TGRHavoc/live_map |")
            print("|===================================================|")
            latest = false -- Stop running the timeout
        end

        if (latest) then -- If it's the latest then check for updates every 30 mins
            SetTimeout( 30 * (60*1000), checkForUpdate)
        end

    end, "GET", "",  { ["Content-Type"] = 'application/json' })
    
end


checkForUpdate();
