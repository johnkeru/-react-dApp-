const { assert } = require("console")

const Election = artifacts.require('./Election.sol')

contract("Election", () => {
    it("check the number of participants", () => {
        return Election.deployed().then(ins => ins.index())
            .then(index => index == 2 ? true : false)
    })
})