// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract GreeterNotifier {
    string greeting;

    event ReactiveNotification(
        address indexed from,
        address indexed to,
        string title,
        string description,
        uint256 chainId,
        string cta,
        bytes data
    );

    constructor() {
        greeting = "Hello, World!";
    }

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
        emit ReactiveNotification(
            address(this),
            msg.sender,
            "Greeting Updated",
            _greeting,
            block.chainid,
            "https://example-cta.com",
            "0x"
        );
    }
}
