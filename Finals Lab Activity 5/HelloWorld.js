import React from "react";
import { useEffect, useState } from "react";
import {
  helloWorldContract,
  connectWallet,
  UpdatedMessages,
  loadCurrentMessage,
  getCurrentWalletConnected,
} from "./util/interact.js";

import alchemylogo from "./alchemylogo.svg";

const HelloWorld = () => {
  //state variables
  const [walletAddress, setWallet] = useState("");
  const [status, setStatus] = useState("");
  const [message, setMessage] = useState("No connection to the network."); //default message
  const [newMessage, setNewMessage] = useState("");

  //called only once
  useEffect(() => {
    async function fetchData() {
      const message = await loadCurrentMessage();
      setMessage(message);

      const { address, status } = await getCurrentWalletConnected();
      setWallet(address);
      setStatus(status);
    }

    fetchData();
    addSmartContractListener();
    addWalletListener();
  }, []);

  function addSmartContractListener() {
    helloWorldContract.events.UpdatedMessages({}, async (error, event) => {
      if (error) {
        setStatus("😢" + error.message); // Emoticon for error
      } else {
        const newMessageValue = await loadCurrentMessage(); // Load the new message from the contract
        setMessage(newMessageValue);
        setNewMessage("");
        setStatus("🎉 Yehey! Your Message has been updated"); // Emoticon for success
      }
    });
  }

  function addWalletListener() {
    if (window.ethereum) {
      window.ethereum.on("accountsChanged", (accounts) => {
        if (accounts.length > 0) {
          setWallet(accounts[0]);
          setStatus("👆 Write a message in the text-field above.");
        } else {
          setWallet("");
          setStatus("🦊 Connect to Metamask using the top right button.");
        }
      });
    } else {
      setStatus(
        <p>
          {" "}
          🦊{" "}
          <a target="_blank" href={`https://metamask.io/download`}>
            You must install Metamask, a virtual Ethereum wallet, in your
            browser.
          </a>
        </p>
      );
    }
  }

  const connectWalletPressed = async () => {
    const walletResponse = await connectWallet();
    setStatus(walletResponse.status);
    setWallet(walletResponse.address);
  };

  const onUpdatePressed = async () => {
    const { status } = await UpdatedMessages(walletAddress, newMessage);
    if (status === "🎉 Message has been updated") {
      setStatus(status);
      const updatedMessage = await loadCurrentMessage();
      setMessage(updatedMessage);
      setNewMessage("");
    } else {
      setStatus(status);
    }
  };

  //the UI of our component
  return (
    <div id="container">
      <img id="logo" src={alchemylogo} alt="Alchemy Logo"></img>
      <button id="walletButton" onClick={connectWalletPressed}>
        {walletAddress.length > 0 ? (
          "Connected: " +
          String(walletAddress).substring(0, 6) +
          "..." +
          String(walletAddress).substring(38)
        ) : (
          <span>Connect Wallet</span>
        )}
      </button>

      <h2 style={{ paddingTop: "50px" }}>Current Message:</h2>
      <p>{message}</p>

      <h2 style={{ paddingTop: "18px" }}>New Message:</h2>

      <div>
        <input
          type="text"
          placeholder="Update the message in your smart contract."
          onChange={(e) => setNewMessage(e.target.value)}
          value={newMessage}
        />
        <p id="status">{status}</p>

        <button id="publish" onClick={onUpdatePressed}>
          Update
        </button>
      </div>
    </div>
  );
};

export default HelloWorld;
