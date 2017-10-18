pragma solidity ^0.4.17;
import './Ownable.sol';

contract Minna {
    
    address public owner;
     modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


    //a struct to represent a team
    struct Meam {

        bytes32 teamName;
        uint contributionTotal; //total points for a team
        mapping (uint => member) TeamID; //each member registers with a TeamID
        
    }
    
    //struc that has information for one member
    struct Member {

        address addressMember; //external publicn address of a particular member
        uint contributionPoints; //total points collected by member
    }
    
    Member[] public members;
    
    //team[] arrayTeams; 
    
    //function to register a member to a team
    // eg: david registers himself to the dev team 

    function register(address _addressMember, uint _contributionPoints) public onlyOwner {

        //putting the information of a member inside a stuct - but why?
       Member memory newMember;
       newMember.contributionPoints = _contributionPoints;
 

       members.push(newMember);
       return true;


    }
    
    
} //contract ends