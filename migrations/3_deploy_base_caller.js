const Base = artifacts.require("Base");
const Caller = artifacts.require("Caller");

module.exports = function (deployer) {
  deployer.deploy(Base);
  deployer.deploy(Caller);
};
