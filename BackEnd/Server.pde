import java.net.*;
import java.io.*;

public class Server {
  ArrayList<ClientHandlingThread> threads;


  public void runServer() {
    ServerSocket socket = null; // This is the socket that will hold the socket for the server
    ArrayList<ClientHandlingThread> threads = new ArrayList<ClientHandlingThread>(); // This is an array list containing all of the threads for handling the clients


    try {
      socket = new ServerSocket(23456); // This intantiates the socket
    }
    catch (IOException e) {
      e.printStackTrace(); // Exception handling
    }

    Socket client = null; // This will be a client socket if it has been accepted
    while (true) { // The infinite loop dealing with accepting clients and starting the threads
      try {
        client = socket.accept(); // This essentially accepts a connection from a client
        ClientHandlingThread c = new ClientHandlingThread(client,threads); // This creates a thread to deal with this client
        c.start(); // This starts the thread
        threads.add(c); // This adds the thread to the array list
      }
      catch (IOException e) {
        e.printStackTrace(); // Exception handling
      }
    }
  }

  private class ClientHandlingThread extends Thread { // This is the handling thread
    private Socket socket = null; // This is the socket that is passed in.
    private Orb orb;
    public ArrayList<ClientHandlingThread> threads;
    public ClientHandlingThread(Socket s, ArrayList<ClientHandlingThread> x) {
      super("Server Thread");
      this.socket = s;
      threads = x;
    
  }
    
    
    
    public void run() {
      try {
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true); // Creates the writer so that we can write to the server
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream())); // Creates the input stream so that we can get input from the server

        String inputLine; // This will be the input from the server

        while ( (inputLine = in.readLine ()) != null) { // This is essentially a loop that will run everytime input line gets something new from the server
          out.println(interpret(inputLine)); // Because this is an echo program we will just give back to the client anything that is given to us by the client
        }
        socket.close(); // If we are out of the loop we will close all of our streams
        out.close();
        in.close();
      }
      catch (IOException e) {
        e.printStackTrace(); // Exception handling
      }
    }

      
  }
  
}

