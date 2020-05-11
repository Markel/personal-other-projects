// This is a comment (it seems)


fn main() {
    let mut x: i32 = 5; // ! When compiling there will be a warning that this is never used, degrees cry...
    let y = 2;
    x = 6;
    let degrees: f32 = x as f32; // Some help used https://stackoverflow.com/a/28280042/9547841
    variables_and_mutability(x, y);
    data_types(x, y);
    functions();
    control_flow();
    fahrenheit_converter(degrees);
}

fn variables_and_mutability(x: i32, y: i32) {
    println!("The value of x is {} and for y is {}", x, y);
    println!("The value of my mutable x is {} and y continues to be {}", x, y);
}

fn data_types(x: i32, y: i32) {
    let integer: u128 = 99999999999999999999999999999999999999; // ? Something strange is here, check it another day
    println!("Guess = {}", integer);
    let float1: f64 = 34.5;
    let float2: f64 = 42.3;
    // addition
    let sum = x + y;

    // subtraction
    let difference = y - x;

    // multiplication
    let product = y * 30;

    // division
    let quotient = float1 / float2;

    // remainder
    let remainder = x % y;
    println!("sum {} diffe;rence {} product {} quotient {} remainder {}", sum, difference, product, quotient, remainder);

    let boolean: bool = false;
    println!("It's {} that you are not worthy :)", boolean);

    let mut emoji = '😍';
    println!("I {} emojis, don't you?", emoji);
    emoji = '😉';
    println!("Why wouldn't you? {}", emoji);
    // As a note terminals and UTF-8 aren't best friends

    let tuple: (i32, f64, bool) = (500, 6.4, true);
    println!("Is it {} that {} and {} have some relation?", tuple.2, tuple.0, tuple.1);

    // I love arrays, but not going to experiment with them here 🤷‍♂️
}

fn functions() {
    fn number() -> i32 {
        let x = 3;
        x + 1
    }

    let y = number();
    println!("The value of y is: {}", y);
    // * I mean, there isn't too much in here, but it is because I changed everything
}

fn control_flow() {
    let mut number: u32 = 1;
    fn check_number(number: u32) {
        if number > 3 {
            println!("Number is bigger than 3");
        } else { // It kinda hurts my eyes that you put them in the same line
            println!("Number is {}", number);
        }
    }
    loop { // Could be a while
        check_number(number);
        number = if number < 3 {number + 1} else {break};
        println!("Adjusting number...");
    }
}

fn fahrenheit_converter(degrees: f32) {
    // ! It's wrong, just as a note
    let degrees = degrees - 32 as f32;
    println!("{}", degrees);
    let degrees = degrees * 5 as f32;
    let degrees = degrees / 9 as f32;
    println!("The result, in a much nicer unit, is {}", degrees)
}