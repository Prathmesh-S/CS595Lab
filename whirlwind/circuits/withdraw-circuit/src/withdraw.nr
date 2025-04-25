use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

fn main(
    r: Field,
    index: Field,
    hashpath: [Field; 8],
    root: pub Field,
    id: pub Field
) {

    //Recompute Commitment
    let commitment = pedersen_hash([id, r]);

    //Check Root + nullifier: Constrains 1,2, and 3. 
    let recomputed_root = compute_merkle_root(commitment, index, hashpath);
    assert(recomputed_root == root, "Merkle root mismatch");
}