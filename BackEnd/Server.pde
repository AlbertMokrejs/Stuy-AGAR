import java.net.*;
import java.io.*;

public class Server {
  



    public void runServer() {
  ServerSocket socket = null; // This is the socket that will hold the socket for the server
  ArrayList<ClientHandlingThread> threads = new ArrayList<ClientHandlingThread>(); 
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
    ClientHandlingThread c = new ClientHandlingThread(client); // This creates a thread to deal with this client
    c.start(); // This starts the thread
    threads.add(c); // This adds the thread to the array list
    c.O = new Orb((int)(Math.random()*3000),(int)(Math.random()*3000,2)
    
 
    }
      catch (IOException e) {
    e.printStackTrace(); // Exception handling
      }
  }
    }

    private class ClientHandlingThread extends Thread { // This is the handling thread
  private Socket socket = null; // This is the socket that is passed in.
  public Orb O;
  public ClientHandlingThread(Socket s) { // Very simple constructor
      super("Server Thread");
      this.socket = s;
  }

  public void run() {
      try {
    PrintWriter out = new PrintWriter(socket.getOutputStream(), true); // Creates the writer so that we can write to the server
    BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream())); // Creates the input stream so that we can get input from the server
    
    String inputLine; // This will be the input from the server

    while ((inputLine = in.readLine()) != null) { // This is essentially a loop that will run everytime input line gets something new from the server
        
        
        
        
        out.println(interpret(inputLine)); 
        
        
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
    
    public String interpret(String a){
       int i = a.indexOf(" ");
       int x = Integer.parseInt(a.substring(0,i+1));
       int y = Integer.paresInt(a.substring(i+1,a.length()));
       
 
      
    }
}

