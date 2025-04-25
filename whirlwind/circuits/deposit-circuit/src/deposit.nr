//Our Deposit Noir circuit
use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

//Notes: 
//Test with Tree Depth = 8
//This value is default for empty leaf: 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63

fn main(
     id: Field,
     r: Field,
     oldPath: [Field; 8],
     oldRoot: pub Field,
     newRoot: pub Field, 
     commitment: pub Field,
     index: pub Field
 ) {

    //Ensure commitment constraint
    let computed_commitment = pedersen_hash([id, r]);
    assert(computed_commitment == commitment);

    //New Merkle Tree Root Constraint
    let recomputed_new_root = compute_merkle_root(commitment, index, oldPath);
    assert(newRoot == recomputed_new_root);

    //Old Root is Valid
    let recomputed_old_root = compute_merkle_root(0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63, index, oldPath);
     assert(oldRoot == recomputed_old_root);
 }