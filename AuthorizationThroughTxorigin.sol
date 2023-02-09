pragma solidity ^0.6.0;

contract Bank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
		//Autorização incorreta
        require(msg.sender == tx.origin, "Not authorized");
        balances[tx.origin] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(msg.sender == tx.origin, "Not authorized");
        require(balances[tx.origin] >= _amount, "Insufficient funds");
        balances[tx.origin] -= _amount;
        msg.sender.transfer(_amount);
    }
}



