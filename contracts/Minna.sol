pragma solidity ^0.4.11;
import './Ownable.sol';

contract Minna {
    
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
         _;
    }

    struct Team {
        bytes32 teamName;
        //uint contributionTotal; //total points for a team -> probably won't need, unecessary at this point
        //mapping (uint => Member) TeamID; //each member registers with a TeamID -> chaning some mapping
        mapping (address => Member) memberInfo; //address of the member + its points 
    }
    
    //struc that has information for one member
    struct Member {
        // bytes32 [] teamName; //can be in many teams 
        uint contributionPoints; //total points collected by member
    }
    
    Member[] public members;
    Team[] public teams;
    // mapping(address => members) memberAddresses;

    function Minna() public {
        owner = msg.sender;
    }
    
    event RegisterMember(address _address, uint _contributionPoints);
    event RegisterTeam(bytes32 _teamName, address _addressMember);
    
    //function to register a member to a team
    // eg: david registers himself to the dev team 

    function registerMember(address _addressMember, uint _contributionPoints) payable onlyOwner public {

       Member memory newMember;
       newMember.contributionPoints = _contributionPoints;
       members.push(newMember);
       
       RegisterMember(msg.sender, _contributionPoints);
    }

    function getMembers() constant returns (uint length) {
            return members.length;
    }

    function registerTeam(bytes32 _teamName, address _addressMember) payable onlyOwner public {

        Team memory newTeam;
        newTeam.teamName = _teamName;
        teams.push(newTeam);
        RegisterTeam(_teamName, msg.sender);

    }


}