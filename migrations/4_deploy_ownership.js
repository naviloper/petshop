const Ownership = artifacts.require("Ownership");

module.exports = function (deployer) {
  deployer.deploy(Ownership);
};
