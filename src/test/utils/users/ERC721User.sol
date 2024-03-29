// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.10;

import { ERC721TokenReceiver } from "@solmate/tokens/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract ERC721User is ERC721TokenReceiver {
  IERC721 token;

  constructor(address _token) {
    token = IERC721(_token);
  }

  function onERC721Received(
    address,
    address,
    uint256,
    bytes calldata
  ) public virtual override returns (bytes4) {
    return ERC721TokenReceiver.onERC721Received.selector;
  }

  function approve(address spender, uint256 tokenId) public virtual {
    token.approve(spender, tokenId);
  }

  function setApprovalForAll(address operator, bool approved) public virtual {
    token.setApprovalForAll(operator, approved);
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual {
    token.transferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public virtual {
    token.safeTransferFrom(from, to, tokenId);
  }

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  ) public {
    token.safeTransferFrom(from, to, tokenId, data);
  }
}
