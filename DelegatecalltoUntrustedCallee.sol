pragma solidity ^0.7.0;

contract Lottery {
    address public owner;
    uint256 public prizePool;

    function Lottery() public {
        owner = msg.sender;
    }

    function enter() public payable {
        prizePool += msg.value;
    }

    function randomNumberGenerator(bytes memory data) public returns (uint256) {
        return uint256(keccak256(abi.encodePacked(data))) % prizePool;
    }

    function selectWinner() public {
        address winner = address(0);
        uint256 randomNumber = randomNumberGenerator(abi.encodePacked(block.timestamp));
        uint256 counter = 0;

        for (uint256 i = 0; i < prizePool; i++) {
            if (counter >= randomNumber) {
                winner = address(i);
                break;
            }
            counter++;
        }

        winner.delegatecall(bytes4(keccak256("claimPrize()")));
    }

    function claimPrize() public {
        require(msg.sender == winner, "You are not the winner");
        msg.sender.transfer(prizePool);
        prizePool = 0;
    }
}