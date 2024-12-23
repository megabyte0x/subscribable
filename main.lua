Subscribable = require("subscribable")({
    useDB = false
});

Counter = Counter or 0

Subscribable.configTopicsAndChecks({
    'counter', -- topic name
    function() -- a check function to determine if the event of the occurs & generate a notification payload
        print("notified!")
        return { counter = Counter }
    end
})

function increase()
    Counter = Counter + 1;
    Subscribable.notifyTopic('counter')
end

Handlers.add("increase", increase)


-- ao.send({
--     Target = SERVICE,
--     Action = 'Register-Subscriber',
--     Topics = json.encode({ 'counter' })
-- })
