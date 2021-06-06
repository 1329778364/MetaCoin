// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

contract Voting{
    bytes32[] public candidateList;
    mapping(bytes32=>uint8) public votesRecived;
    constructor(byte32[] candidateNames) public{
        candidateList = candidateNames
    }

    function validateCandidate(byte32 candidateName) internal view returns(bool){
        for(uint8 i=0;i<candidateList.length;i++){
            if(candidateName == candidateList[i]){
                return true
            }
        }
        return false
    }

    function vote(byte32 candidateName) public {
        require(validateCandidate(candidateName));
        votesRecived[candidateName] += 1
    }

    function totalVoteFor(byte32 candidateName) public view return(uint8){
        require(validateCandidate(candidateName));
        return votesRecived[candidateName]
    }
}