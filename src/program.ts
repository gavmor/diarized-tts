import { Command } from "commander";
import { foo } from "./foo";

export const program = new Command();

// Define a default command
const defaultAction = () => {
    console.log("No specific subcommand was provided.");
};

program
    .action(defaultAction) // Set the default action here
    .command('foo')
    .argument('bar', 'An argument')
    .option('-q, --qux', 'An option')
    .action(foo);