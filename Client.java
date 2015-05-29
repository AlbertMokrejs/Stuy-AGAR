import java.util.*;
import java.io.*;
import java.net.*;

public class Client {
    private final String serverAddress = "127.0.0.1"; // IP of the server to connect to
    private final int port = 23456; // Port of the server to connect to, pick an unused port, a high one is usually unused, note, this has to be below 65535

    public static void main(String[] args) {
	Client a = new Client();
	a.runClient();
    }

    public boolean runClient() { // This is the 'main' function of this client -- to be called by the ClientRun class
	Socket serverSocket = null; // Sets up the socket, out and in variables
	PrintWriter out = null;
	BufferedReader in = null;

	try {
	    serverSocket = new Socket(serverAddress, port); // Connects to the server on the address and the port
	    out = new PrintWriter(serverSocket.getOutputStream(), true); // Creates the streams
	    in = new BufferedReader(new InputStreamReader(serverSocket.getInputStream()));
	}
	catch (UnknownHostException e) {
	    e.printStackTrace(); // Exception handling
	    return false;
	}
	catch (IOException e) {
	    e.printStackTrace(); // Excpetion handling
	    return false;
	}

	Scanner console = new Scanner(System.in); // For reading input from the user

	String input = ""; // Input from the user

	System.out.print("input: "); // Prompt
	while ((input = console.nextLine()) != null) { // Another loop that will run whenever the user presses enter
	    if (input.equals("bye")) { // If the user enters bye we want to quit
		out.println("bye"); // Send bye to the server telling it to close our thread
		break; // Breaks out of the loop
	    }
	    else {
		out.println(input); // Else, just give the data to the server
	    }
	    try {
		System.out.println("Server: " + in.readLine()); // Then read what the server responded with
	    }
	    catch (IOException e) {
		e.printStackTrace(); // Exception handling
	    }
	    System.out.print("input: "); // For the loop
	}

	try {
	    out.close(); // If the loop is over, close all of the streams and the socket
	    in.close();
	    console.close();
	    serverSocket.close();
	}
	catch (IOException e) {
	    e.printStackTrace(); // Exception handling
	}
	return true;
    }
}
