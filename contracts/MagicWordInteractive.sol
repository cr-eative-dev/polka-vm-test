// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title MagicWord
 * @dev Store za magic word and get za magic sentence
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract MagicWord {

    string private magicWord;
    string[] private adjectives;
    uint256 private nonce;
    
    constructor() {
        adjectives = [
            "amazing", "awesome", "brilliant", "beautiful", "brave", 
            "bold", "bright", "calm", "charming", "cheerful", 
            "clever", "colorful", "comfortable", "confident", "considerate", 
            "cool", "courageous", "creative", "curious", "daring", 
            "dazzling", "delightful", "determined", "diligent", "dynamic", 
            "eager", "elegant", "enchanting", "energetic", "enthusiastic", 
            "excellent", "exceptional", "exciting", "extraordinary", "fabulous", 
            "fantastic", "fearless", "friendly", "fun", "funny", 
            "generous", "gentle", "glorious", "good", "gorgeous", 
            "graceful", "great", "happy", "harmonious", "helpful", 
            "honest", "honorable", "humorous", "imaginative", "impressive", 
            "independent", "innovative"
        ];
    }

    function inputMagicWord(string memory word) public {
        magicWord = word;
    }

    function makeMagicBaby() public returns (string memory) {
        require(bytes(magicWord).length > 0, "No magic word has been stored yet");
        
        nonce++;
        
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, nonce, msg.sender))) % adjectives.length;
        
        return string(abi.encodePacked(magicWord, " is ", adjectives[randomIndex], "!"));
    }
    
    function getCurrentMagicWord() public view returns (string memory) {
        return magicWord;
    }
}