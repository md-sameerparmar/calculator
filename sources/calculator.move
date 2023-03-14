module calc_addr::Calculator{
    
    use std::debug::print;

    const ARITHMETIC_ERROR: u64 = 0;
    const ENO_RESULT: u64 = 1;

    #[view]
    public fun get_add(n1:u64,n2:u64): u64 {

        let res = n1 + n2;

        res
    }

    #[view]
    public fun get_sub(n1:u64,n2:u64): u64 {
        assert!(n1 >= n2, ARITHMETIC_ERROR);
        let res = n1 - n2;

        res
    }

    #[view]
    public fun get_mul(n1:u64,n2:u64): u64 {

        let res = n1 * n2;

        res
    }

    #[view]
    public fun get_div(n1:u64,n2:u64): u64 {
        assert!(n2 > 0, ARITHMETIC_ERROR);
        let res = n1 / n2;

        res
    }


    #[test(account = @0x1)]
    public entry fun test_add(){
        let add_res = get_add(5,5);
        let sub_res = get_sub(5,5);
        let mul_res = get_mul(5,5);
        let div_res = get_div(5,0);
        print(&add_res);
        print(&sub_res);
        print(&mul_res);
        print(&div_res);
    }
    
}


// aptos move view --function-id 'default::Calculator::get_add' --args 'u64:10' 'u64:10' ------ for addition
// aptos move view --function-id 'default::Calculator::get_sub' --args 'u64:10' 'u64:5' ------ for substraction
// aptos move view --function-id 'default::Calculator::get_mul' --args 'u64:10' 'u64:10' ------ for multiplication
// aptos move view --function-id 'default::Calculator::get_div' --args 'u64:10' 'u64:5' ------ for division