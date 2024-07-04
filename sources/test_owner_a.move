/// Module: test_owner_a
module test_owner_a::test_owner_a {
    use std::string::String;

    public struct Memo has key, store {
        id: UID,
        owner: address,
        message: Message
    }

    public struct Message has store, drop {
        message: String,
        note: String
    }

    public fun new(
        owner: address,
        message: String,
        note: String,
        ctx: &mut TxContext
    ): Memo {
        let message = Message { message: message, note: note };
        let memo = Memo {
            id: object::new(ctx),
            owner: owner,
            message: message
        };
        
        (memo)
    }
}
