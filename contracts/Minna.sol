pragma solidity ^0.4.17;
import './Ownable.sol';

contract Minna {
    
    uint contributionPoints; //total points collected by member

    //a struct to represent teams
    // eg: 2 teams with 5 members each
    struct teams {
        
        bytes32 teamName;
        uint contributionTotal; //total points for the team
        mapping (uint => team) numberOfMembers; //total # of members
        
    }
    
    //struc that has information for one team
    struct team {
        address member; //external publicn address of a particular member
        bytes32 registerWithTeam; 
    }
    
    team[] arrayTeams; 
    
    //function to register a member to a team
    // eg: david registers himself to the dev team 
    
    
} //contract ends