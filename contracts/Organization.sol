pragma solidity ^0.4.11;

contract Organization{
    mapping(address => Member) public members;
    address public chairperson;

    struct Member{
        bytes32 name;
        string []flags; //place a ts
    }
    
    function Organization(){
        chairperson = msg.sender;
    }
    
    function addMember(address _memberAddress, bytes32 memberName){
        members[_memberAddress].name = memberName;
    }
    //person calling this method needs to pay ETH in future
    function updateFlags(address _memberAddress, string _reason) public{
        members[_memberAddress].flags.push(_reason);
    }
    
    
    function getFlagsCountOfMember(address _memberAddress) returns (uint) {
        return members[_memberAddress].flags.length;
    }
    
    
}