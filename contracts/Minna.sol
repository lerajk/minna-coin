
pragma solidity ^0.4.11;
//import './Ownable.sol';

contract Minna {

    
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
         _;
    }

    //a struct to represent a team
    struct Team {
        bytes32 teamName;
        //uint contributionTotal; //total points for a team -> probably won't need, unecessary at this point
        //mapping (uint => Member) TeamID; //each member registers with a TeamID -> chaning some mapping
        mapping (address => Member) memberInfo; //address of the member + its points 
    }
    
    //struc that has information for one member
    struct Member {
        address addressMember; //external publicn address of a particular member -> won't need this
        uint contributionPoints; //total points collected by member
    }
    
    Member[] public members;

    Team[] public teams;
    
    //team[] arrayTeams;

    function Minna() public {
        owner = msg.sender;
    }
    
    event Register(address _address, uint _contributionPoints);
    event RegisterTeam(bytes32 _teamName, address _addressMember);
    
    //function to register a member to a team
    // eg: david registers himself to the dev team 

    function register(address _addressMember, uint _contributionPoints) payable onlyOwner public {

        //putting the information of a member inside a stuct - but why?
       Member memory newMember;
       newMember.contributionPoints = _contributionPoints;
       newMember.addressMember = _addressMember;
       members.push(newMember);
       Register(msg.sender, _contributionPoints);
      // return true;
    }

    //function to register a team 
    function registerTeam(bytes32 _teamName, address _addressMember) payable onlyOwner public {

        Team memory newTeam;
        newTeam.teamName = _teamName;
        teams.push(newTeam);
        RegisterTeam(_teamName, msg.sender);

    }

    //get members for a team 

   



} //contract ends