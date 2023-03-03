pragma solidity >=0.7.0 <0.9.0;

contract ProofOfExistence {
    mapping (bytes32 => bool) private proofs;

    function storeProof(bytes32 proof) private {
        proofs[proof] = true;
    }

    function proofFor(string memory document) private pure returns (bytes32) {
        return sha256(bytes(document));
    }

    function notarize(string memory document) public {
        storeProof(proofFor(document));
    }

    function checkDocument(string memory document) public view returns (bool) {
        return proofs[proofFor(document)];
    }
}