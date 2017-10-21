//solidity contract to track harassment at a work

pragma solidity ^0.4.11;

contract Harassment {

    
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
         _;
    }   
    
    //struc that has information for one member
    struct Member {
        address addressMember; //external public address of a particular member -> won't need this
        uint flags; //total flags against the member
    }

      struct harassmentProposal {
        bytes32 description;   // description of harssment 
        address against; //address of member who is this proposal against 
        bool flagRegistered; //if the flag was registered against the person
    }
    
    Member[] public members;

    harassmentProposal[] public proposals;

    mapping (address => Member) memberInfo;
    
    
    event reegisterProposals(address _addressofSender, bool _success);
    event RegisterTeam(bytes32 _teamName, address _addressMember);
    


    function checkFlags(address _addressMember) constant returns(uint) {

    	return flags; 
    }

    function registerProposal(bytes32 _description, address _against) payable onlyOwner public {

        //putting the information of a member inside a stuct - but why?
       memory newProposal;
       newProposal.description = _description;
       newProposal.against = _against;
       newProposal.flagRegistered = true;
       proposals.push(newProposal);
       registerProposals(msg.sender, newProposal.flagRegistered);
      // return true;
    }

    /*

    //function to register a team 
    function registerTeam(bytes32 _teamName, address _addressMember) payable onlyOwner public {

        Team memory newTeam;
        newTeam.teamName = _teamName;
        teams.push(newTeam);
        RegisterTeam(_teamName, msg.sender);

    } */


} //contract ends