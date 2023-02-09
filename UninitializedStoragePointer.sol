pragma solidity ^0.7.0;

contract Bank {
	//ponteiro não inicializado
    mapping(address => uint256) public balances;

    function deposit(uint256 value) public payable {
        balances[msg.sender] += value;
    }

    function withdraw(uint256 value) public {
        uint256 currentBalance = balances[msg.sender];
        require(currentBalance >= value, "Insufficient funds");
        balances[msg.sender] -= value;
        msg.sender.transfer(value);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}