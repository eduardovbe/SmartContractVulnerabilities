pragma solidity ^0.7.0;

contract AssertTest {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function getValue() public view returns (uint256) {
        assert(value > 0);
        return value;
    }
}