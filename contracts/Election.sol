pragma solidity >=0.4.22;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write candidate
    mapping(uint => Candidate) public candidates;

        // Store Candidates Count
    uint public candidatesCount;

    // Constructor
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    //Store accounts that have voted
    mapping(address => bool) public voters;

    function vote (uint _candidateId) public {
        //require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter  has voted
        voters[msg.sender] = true;

        //update candidate vote Count
        candidates[_candidateId].voteCount ++;

    }
}