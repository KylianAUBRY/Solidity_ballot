// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.25;

contract Ballot {
    struct Cendidate {
        string name;
        uint voteCount;
    }

    struct Elector{
        address delegate;
        uint electoralNumber;
        bool voted;
        uint vote;
    }

    mapping(uint => address) private adresses;
    mapping (address => Elector) public electors;
    Cendidate[] public cendidates;

    function register(uint _number) public
    {
        require(adresses[_number] == address(0), "this number already exists.");
        require(electors[msg.sender].electoralNumber == 0, "this address is already assigned to a number.");

        //ici implementer une verification sur le numero savoir si le numero electorale est valide ou non.

        Elector memory newPerson = Elector(msg.sender, _number, false, 0);
        electors[msg.sender] = newPerson;
        adresses[_number] = msg.sender;
    }

    // function vote(uint _number, )
}