pragma solidity ^0.4.0;

contract Vulnerable {
    uint256 balance;

    function add(uint256 value) public {
        balance += value;
    }
	//adição do valor máximo representável por um int256, ocorrendo um overflow
    function exploit() public {
        add(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    }
}