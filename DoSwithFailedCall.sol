pragma solidity ^0.6.0;

contract Game {
    uint256 public jackpot;

    function play() public payable {
        require(msg.value > 0, "You must send some Ether to play the game");
        jackpot += msg.value;

        // Chamada com potencial de loop infinito
        address untrusted = 0x123456789abcdef0123456789abcdef0123456789;
        untrusted.call.value(msg.value)("");

        jackpot -= msg.value;
        msg.sender.transfer(msg.value * 2);
    }
}