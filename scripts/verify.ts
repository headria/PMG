import hre from "hardhat";
(async () => {
  await hre.run("verify:verify", {
    address: "0x0572400a0b85C41595f1C402E4CE426DE2E198c7",
  });
})();
