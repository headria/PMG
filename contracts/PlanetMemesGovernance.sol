// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

/// @custom:security-contact cto@planetmemes.com

contract PlanetMemesGovernance is
    ERC20,
    ERC20Burnable,
    ERC20Permit,
    ERC20Votes,
    Ownable
{
    bytes32 private constant _HASHED_NAME =
        keccak256("Planet Memes Governance");
    bytes32 private _secretHash;

    // Event emitted when a commit is made
    event Commit(bytes32 hashedName, uint256 amount);

    constructor()
        ERC20("Planet Memes Governance", "PMG")
        ERC20Permit("Planet Memes Governance")
    {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }

    function commit(uint256 amount, bytes32 secretHash) external {
        require(amount > 0, "Amount must be greater than 0");
        require(_secretHash == 0, "Commitment already made");

        _secretHash = secretHash;

        // Emit a Commit event with the hash of the name and the amount
        emit Commit(_HASHED_NAME, amount);
    }

    function reveal(uint256 amount, bytes32 secret) external {
        require(amount > 0, "Amount must be greater than 0");
        require(_secretHash != 0, "No commitment made");
        require(
            keccak256(abi.encodePacked(secret)) == _secretHash,
            "Invalid secret"
        );

        // Reset the secretHash
        _secretHash = 0;

        // Transfer the tokens
        _transfer(msg.sender, address(this), amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(
        address account,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._burn(account, amount);
    }
}
