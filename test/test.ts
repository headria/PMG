import { expect } from "chai";
import { ethers } from "hardhat";

describe("PlanetMemesGovernance", function () {
  it("Test contract", async function () {
    const ContractFactory = await ethers.getContractFactory("PlanetMemesGovernance");

    const instance = await ContractFactory.deploy();
    await instance.deployed();

    expect(await instance.name()).to.equal("Planet Memes Governance");
  });
});
