pragma solidity ^0.6.0;

contract Timer {
    uint public startTime;
    uint public duration;
    uint public endTime;

    function start(uint _duration) public {
        startTime = block.timestamp;
        duration = _duration;
        endTime = startTime + duration;
    }

    function isExpired() public view returns (bool) {
        return block.timestamp >= endTime;
    }

    function claim() public {
        require(isExpired(), "Timer has not expired yet.");
        // do something
    }
}