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
        bytes32 name; //name of the member
    }

      struct harassmentProposal {
        bytes32 description;   // short description of harssment 
        address against; //address of member who is this proposal against 
        bool flagRegistered; //if the flag was registered against the person
    }
    
    //Member[] public members;

    //harassmentProposal[] public proposals;

    //mapping (address => Member) memberInfo;
    
    mapping (address => harassmentProposal) proposals;
    
    mapping (address => Member) members;
    
    
    //event registerProposals(address _addressofSender, bool _success);
    //event RegisterTeam(bytes32 _teamName, address _addressMember);
    

    /*function checkFlags(address _addressMember) constant returns(uint) {

      return flags; 
    } */ 

    function registerProposal(bytes32 _description, address _against) payable onlyOwner public {

        //register a proposal?
        proposals[msg.sender].description = _description;
        proposals[msg.sender].against = _against;
        proposals[msg.sender].flagRegistered = true;

        
       //memory newProposal;
       //newProposal.description = _description;
       //newProposal.against = _against;
       //newProposal.flagRegistered = true;
       //proposals.push(newProposal);
       //registerProposals(msg.sender, newProposal.flagRegistered);
      // return true;
    }

    
    //function to register a member to the system
    function registerMember(bytes32 _name) payable onlyOwner public {

        members[msg.sender].name = _name;
        members[msg.sender].addressMember = msg.sender;

        
        //Team memory newTeam;
        //newTeam.teamName = _teamName;
        //teams.push(newTeam);
        //RegisterTeam(_teamName, msg.sender);

    } 


} //contract ends