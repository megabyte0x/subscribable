# Subscribable Process

## Steps to recreate:

### Terminal 1 (Subscription Process)

1. Open AOS and deploy `main.lua`
2. Note the process ID

### Terminal 2 (Subscriber Process)

1. Open AOS
2. Send the Register-Subscription message
    ```lua
    local json = require('json')

    ao.send({
        Target = <Subscription_Process_ID>,
        Action = 'Register-Subscriber',
        Topics = json.encode({ 'counter' })
    })
    ```
3. Pay for the Subscription 
    - Currently I am using $0RBT (BUhZLMwQ6yZHguLtJYA5lLUa9LQzLXMXRfaq9FVcPJc) as the payment token.
    1. Transfer 1 $0RBT to the **Subscriber Process**
    2. Transfer $0RBT from Subscriber Process to Subscription Process.
        ```lua
        ao.send({
            Target = 0RBT,
            Action = 'Transfer',
            Recipient =  <Subscription_Process_ID>,
            Quantity = "1000000000000",
            ["X-Action"] = "Pay-For-Subscription",
            ["X-Subscriber-Process-Id"] = ao.id
        })
        ```

### Increase the Counter in Subscription Process
1. Open Terminal 1 
2. Send a message to increase the Counter
    ```lua
    Send({Target = ao.id, Action= "increase"})
    ```

---
You will see the a new message received in Terminal 2 (Subscription Process) with the Tag `Notify-On-Topic`