Subscribable = require("subscribable")({
    useDB = false
});

Counter = Counter or 0

Subscribable.configTopicsAndChecks({
    ['counter'] = {
        checkFn = function() return Counter % 2 == 0 end,
        payloadFn = function() return { counter = Counter } end

    }
})

function increase()
    Counter = Counter + 1;
    Subscribable.checkNotifyTopic('counter')
end

Handlers.add("increase", increase)


-- ao.send({
--     Target = SERVICE,
--     Action = 'Register-Subscriber',
--     Topics = json.encode({ 'counter' })
-- })
