//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    //will be set to 10 during call(constructor)

    mapping(address => bool) public whitelistedAddresses;
    //keeps track that the account is added to whitelist or not

    uint8 public numAddressesWhitelisted;
    //stores number of addresses already in the list

    constructor(uint8 _maxWhitelistedAddresses) {
        //to initialise the max whitelisted accounts allowed
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender is already in Whitelist.");
        //if user account has already registered in whitelist

        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Whitelist has reached its limit");
        //if maximum amount of accounts already done

        whitelistedAddresses[msg.sender] = true;
        //adding the address to whitelsit

        numAddressesWhitelisted += 1;
        //increases the num of whitelisted addresses
    }
}