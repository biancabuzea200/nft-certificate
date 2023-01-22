// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract Certificate is ERC721 {
    uint256 public tokenId;

    constructor() ERC721("DevRelUni1", "DR") {}

    function tokenURI(uint256) public pure override returns (string memory) {
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Dev rEl uni certif", "description": "successful completion", "image": "https://ethereumhacker.com/img/nft.png"}'
                    )
                )
            )
        );

        //string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name":"DeVRel1", "description":"successful completion", "image":"https://ethereumhacker.com/img/nft.png"}'))));
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function mint() public {
        require(tokenId < 1000, "all 1000 have been minted");
        require(balanceOf(msg.sender) == 0, "you already have a certificate");
        _safeMint(msg.sender, tokenId);
        tokenId = tokenId + 1;
    }
}
