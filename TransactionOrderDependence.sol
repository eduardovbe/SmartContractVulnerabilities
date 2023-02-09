pragma solidity ^0.6.0;

contract ERC20 {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    function transfer(address _to, uint256 _value) public {
		//Dependencia de ordem das transações
        require(balances[msg.sender] >= _value, "Insufficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }

    function increaseTotalSupply(uint256 _amount) public {
        totalSupply += _amount;
        balances[msg.sender] += _amount;
    }
}