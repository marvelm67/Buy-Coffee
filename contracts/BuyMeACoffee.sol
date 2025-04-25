// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

//Deployed to arbitrum testnet at  0xAEd970Ff624dFA2655E1fAc1B149fADAf70FDCca

contract BuyMeACoffee {
    // Event to emit when a memo is created
    event NewMemo(
        address indexed from,
        uint256 timeStamp,
        string name,
        string message
    );

    // Memo Struct
    struct Memo{
        address from;
        uint256 timeStamp;
        string name;
        string message;
    }

    // list of all memos received from friends
    Memo[] memos;

    // Address of contract deployer
    address payable owner;

    // Deploy logic
    constructor(){
        owner = payable(msg.sender);
    }

    /**
        * @dev buy a coffee for contract owner
        * @param _name name of the coffee buyer
        * @param _message a message from the coffee buyer
    */
    function buyCoffee(string memory _name, string memory _message) public payable{
        require(msg.value > 0, "Can't buy a coffee with 0 eth");

        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        //emit a log event when a new memo is created! 
        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }


    /**
        * @dev send the entire balance stored in this contract to the owner
    */
    function withdrawTips() public{
        require(owner.send(address(this).balance ));
    }

    /**
        * @dev retrieve all the memos received and stored on blockchain
    */
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}