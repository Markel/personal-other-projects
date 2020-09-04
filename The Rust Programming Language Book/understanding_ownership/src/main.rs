fn main() {
    // * 4.1
    let mut s = String::from("Hello");
    s.push_str(", world!"); // push_str() appends a literal to a String
    println!("{}", s); // This will print `hello, world!`    

    // * 4.2
    let r1 = String::from("Markel");
    let len = calculate_length(&r1);
    println!("The length of '{}' is {}.", r1, len);
    
    fn calculate_length(t: &String) -> usize {
        t.len()
    }
    
    change(&mut s);
    
    { // OMG you can open some curly brackets because you want to without a function :)
        let j: u8 = 200;
        println!("{}", j);
    } // j goes out of scope, bye!

    fn change(some_string: &mut String) {
        some_string.push_str(", world");
    }

    let part = &s[..3];
    println!("3 letters of '{}' are '{}'", s, part)
}
