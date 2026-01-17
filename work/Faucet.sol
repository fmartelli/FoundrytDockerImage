// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.26 <0.9.0;

contract Faucet {
    uint256 public constant MAX_WITHDRAW = 0.0001 ether;
    uint256 public constant COOLDOWN = 1 hours;

    mapping(address => uint256) public lastWithdraw;

    function withdraw(uint256 amount, address payable to) external {
        require(to == msg.sender, "Only to self");
        require(amount <= MAX_WITHDRAW, "Too much");
        require(
            block.timestamp >= lastWithdraw[msg.sender] + COOLDOWN,
            "Cooldown"
        );
        require(address(this).balance >= amount, "Empty");

        lastWithdraw[msg.sender] = block.timestamp;
        (bool ok, ) = to.call{value: amount}("");
        require(ok, "Transfer failed");
    }

    receive() external payable {}
    fallback() external payable {}
}
