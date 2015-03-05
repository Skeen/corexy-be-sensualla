// Generates the message spam
function assert_failed(msg) = (concat("Assertion Failed:", msg, assert_failed(msg)));

// Spams a lot of Assertion Failed messages, if bool evaluates to false
module assert(bool, msg = "")
{
    if(bool == false)
    {
        // Start spam recursion
        echo(assert_failed(msg));
    }
}

// Write a single warning message, if bool evaluates to false.
module warn(bool, msg = "")
{
    if(bool == false)
    {
        echo("!!!WARNING!!!", msg, "!!!WARNING!!!");
    }
}
