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
    uint electoralNumberMax;

    function addCendidate(string memory _name) public {
        cendidates.push(Cendidate(_name, 0));
    }

    function getNumberCendidate() public view returns (uint){
        return cendidates.length;
    }

    function getNameCendidate() public view returns (string[] memory)
    {
        string[] memory names = new string[](cendidates.length);
        for (uint i = 0; i < cendidates.length; i++)
        {
            names[i] = cendidates[i].name;
        }
        return names;
    }

    function register() public
    {
        uint _electoralNumber;
        electoralNumberMax += 1;
        _electoralNumber = electoralNumberMax;
        require(electors[msg.sender].electoralNumber == 0, "this address is already assigned to a number.");

        //ici implementer une verification sur le numero savoir si le numero electorale est valide ou non.

        Elector memory newPerson = Elector(msg.sender, _electoralNumber, false, 0);
        electors[msg.sender] = newPerson;
        adresses[_electoralNumber] = msg.sender;
    }
    


}