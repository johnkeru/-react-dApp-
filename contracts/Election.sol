// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;
contract Election{
    
    constructor() public{
        add_candidate("Marcus");
        add_candidate("Leni");
    }
    
    uint256 index;
    struct Candidate{
        uint256 id;
        string name;
        uint256 votes;
    }
    
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public isVoted;
    
    event voted(
        uint256 id,
        string name,
        uint256 votes
    );
    
    function add_candidate(string memory name) private {
        index++;
        candidates[index] = Candidate(index, name, 0);
    }
    function vote(uint256 _id) external{
        require(!isVoted[msg.sender], "You have already voted.");
        candidates[_id].votes+=1;
        isVoted[msg.sender] = true;
        emit voted(_id, candidates[_id].name, candidates[_id].votes);
    }
}