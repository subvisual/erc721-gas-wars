// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.10;

import { ERC721 } from "@solmate/tokens/ERC721.sol";

contract Solmate is ERC721 {
  uint256 supply;

  constructor() ERC721("MyToken", "MTK") {}

  function tokenURI(uint256) public pure virtual override returns (string memory) {}

  function safeMint(address to, uint256 tokenId) public virtual {
    _safeMint(to, tokenId);
  }

  function mintMany(address to, uint256 qty) public {
    for (uint256 i = 0; i < qty; i++) {
      _safeMint(to, supply);
      supply++;
    }
  }
}
