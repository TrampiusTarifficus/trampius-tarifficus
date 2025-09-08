// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TrampiusTarifficus is ERC20, ERC20Burnable, Ownable {
    // HEAR YE, HEAR YE! By Imperial Decree, I present the greatest, most legendary,
    // truly fantastic token supply EVER CREATED – 4.2069 billion. Believe me, folks, it's YUGE!
    uint256 public constant INITIAL_SUPPLY = 4206900000 * 10 ** 18;

    constructor(
        address burnAddress,
        address poolWallet,
        address communityWallet,
        address reserveWallet,
        address teamWallet,
        address initialOwner
    )
        ERC20("Trampius Tarifficus", "TAR")
        Ownable(initialOwner)
    {
        // 🔥🔥 IMPERIAL BONFIRE OF LEGEND 🔥🔥
        // I hereby command the burning of half the Empire’s treasury!
        // So bold, so brave, believe me—no Emperor has ever burned this much wealth!
        uint256 burnedAmount = INITIAL_SUPPLY / 2;
        _mint(burnAddress, burnedAmount);
        _burn(burnAddress, burnedAmount);

        // 📜 IMPERIAL DECREE ON TOKEN DISTRIBUTION 📜
        // Tremendous, perfect allocation of tokens, folks! Nobody has done distribution better!
        uint256 remainingSupply = INITIAL_SUPPLY - burnedAmount;

        // 60% - For the Imperial Market Pool, because markets love me, markets adore me.
        _mint(poolWallet, (remainingSupply * 60) / 100);

        // 20% - To my glorious Legion of Memes for contests, rewards, and unstoppable viral marketing!
        _mint(communityWallet, (remainingSupply * 20) / 100);

        // 10% - Secured in my great War Chest for future epic conquests and listings. 
        // It's locked and loaded, folks!
        _mint(reserveWallet, (remainingSupply * 10) / 100);

        // 10% - Tribute to my loyal Imperial Architects and advisors. Locked away as proof of our greatness!
        _mint(teamWallet, (remainingSupply * 10) / 100);
    }

    // ✨ THE EMPEROR'S MINT ✨
    // Absolutely tremendous minting power, reserved exclusively for the Emperor.
    // Will never be abused—I'm the most transparent Emperor ever, folks!
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}


