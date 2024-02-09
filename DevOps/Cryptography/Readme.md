##### SSL/TLS Termination

**SSL/TLS Passthrough:**
With SSL/TLS passthrough, intermediaries like load balancers do not terminate the SSL/TLS connection. Instead, they forward the encrypted traffic directly to the backend servers without decrypting it. This method is often used when the backend servers need to handle SSL/TLS termination themselves, typically in scenarios where maintaining end-to-end encryption is a priority.
![Screenshot 2023-08-16 at 11 57 40 AM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/db5fe50f-6294-49f3-b9ba-4cec0795189a)

Advantages:

Provides end-to-end encryption without exposing decrypted data to intermediate devices.
Backend servers retain control over SSL/TLS certificates and configuration.

Disadvantages:

Load balancers and other intermediaries have limited visibility into the encrypted traffic, making traffic inspection and optimizations challenging.
Backend servers must manage SSL/TLS certificates and configurations.

**Full SSL/TLS Termination:**
In this method, the entire SSL/TLS handshake process and decryption are handled by an intermediate device, often referred to as a "SSL/TLS termination proxy" or "SSL offloader." The proxy decrypts the incoming encrypted traffic, inspects the decrypted content, and then forwards the traffic to the backend servers over an internal, unencrypted connection. This enables the proxy to perform tasks like load balancing, traffic inspection, and application-specific optimizations.
![Screenshot 2023-08-16 at 11 58 12 AM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/40830b71-3367-48cc-99b9-e78f6830c5c8)

Advantages:

Allows the proxy to inspect and modify traffic, enabling advanced security features like intrusion detection/prevention and content filtering.
Simplifies certificate management, as the proxy manages the server's SSL/TLS certificates.

Disadvantages:

Introduces an additional point of potential failure or vulnerability.
The communication between the proxy and backend servers is often unencrypted, which can expose data if not properly secured.

**SSL Bridging**
In this method, the load balancer or proxy re-encrypts the traffic.
![Screenshot 2023-08-16 at 12 00 07 PM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/2965c410-7a36-44d6-9f23-c2e97d3cc6e0)

![Screenshot 2023-08-16 at 12 01 27 PM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/2f57184d-3fd0-42e0-a00a-a78921958839)

**SSL/TLS Encryption**

HTTPS (Hypertext Transfer Protocol Secure) is a secure version of the standard HTTP protocol used for transmitting data over the internet. It incorporates encryption mechanisms provided by SSL (Secure Sockets Layer) and its successor, TLS (Transport Layer Security), to ensure the confidentiality and integrity of data exchanged between a client (usually a web browser) and a server.

Here's how HTTPS and SSL/TLS encryption work:

SSL/TLS Handshake:
![Screenshot 2023-08-16 at 12 36 00 PM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/0dc2f85a-569d-493c-9c33-f5904c19792b)

When a client wants to establish a secure connection with a server, it initiates an SSL/TLS handshake. The handshake involves a series of steps to establish the encryption parameters and keys that will be used for secure communication. These steps are:

a. Client Hello: The client sends a "Hello" message to the server, indicating its supported SSL/TLS versions, encryption algorithms, and other parameters.

b. Server Hello: The server responds with its chosen SSL/TLS version, encryption algorithm, and other relevant details.

c. Server's Certificate: The server sends its digital certificate to the client. The certificate includes the server's public key, its identity information, and is signed by a trusted Certificate Authority (CA).

d. Key Exchange: The client generates a random session key, encrypts it using the server's public key (from the certificate), and sends it to the server. This session key will be used to encrypt and decrypt data during the communication session.

e. Finished: Both the client and the server exchange a "Finished" message to confirm that the handshake is complete. From this point, all data exchanged between them will be encrypted using the negotiated encryption algorithm and session key.

The security of SSL/TLS relies on the trustworthiness of digital certificates. Certificates are issued and signed by Certificate Authorities (CAs), organizations that verify the identity of entities requesting certificates. Web browsers and other clients come pre-loaded with a list of trusted root CAs. When a server's certificate is signed by a trusted CA, the client can trust that the server's public key is authentic and use it to establish a secure connection.

![Screenshot 2023-08-16 at 12 37 14 PM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/1f749fb2-bd3d-46f2-b463-5012050c5ab6)

**Self-signed certificate**
![Screenshot 2023-08-16 at 12 39 16 PM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/65e30b8b-d125-41e0-bcb7-6622fc1d65ac)

A self-signed certificate is a type of digital certificate that is generated and signed by the same entity it certifies, without involving a trusted third-party Certificate Authority (CA). In other words, a self-signed certificate is not issued by a recognized and widely trusted CA. Instead, the entity creating the certificate acts as both the issuer and the subject of the certificate.

##### Types of Authentication

One-Way Authentication (One-Way SSL/TLS):
One-way authentication, often referred to as "one-way SSL" or "one-way TLS," is a type of authentication used in secure communication protocols like HTTPS. In one-way authentication, only the server is authenticated to the client, while the client remains unauthenticated. Here's how it works:
When a client connects to a server using one-way SSL/TLS, the server presents its digital certificate to the client.
The client verifies the server's certificate against a list of trusted Certificate Authorities (CAs) to ensure the server's identity.
The communication channel is encrypted between the client and the server using the server's public key from the certificate.
In this scenario, the client does not provide its own certificate to the server for authentication. This means that the server's identity is validated, but the server cannot verify the identity of the client.

Two-Way Authentication (Two-Way SSL/TLS):
Two-way authentication, also known as "mutual authentication," is a more secure form of authentication in which both the client and the server authenticate each other. This is commonly used in scenarios where both parties need to trust each other's identity before proceeding with communication. Here's how it works:
The server presents its digital certificate to the client, just like in one-way authentication.
Additionally, the client presents its own digital certificate to the server.
The server verifies the client's certificate against a list of trusted CAs, just as the client did with the server's certificate.
The communication channel is encrypted between the client and the server using their respective keys from the certificates.
In two-way authentication, both the client and the server validate each other's identities, creating a stronger level of trust and security. This is particularly important in applications where data integrity and confidentiality are paramount.

**Some other concepts**

Truststore:
A truststore is a repository of digital certificates used to verify the authenticity of remote servers or entities in a secure communication process. It is primarily used in SSL/TLS protocols, such as HTTPS. The truststore contains certificates of trusted Certificate Authorities (CAs) and other entities that the client considers trustworthy. When a client connects to a server, it checks the server's certificate against the certificates in its truststore to ensure that the server is legitimate and not presenting a forged certificate. If the server's certificate is signed by a CA in the truststore, the connection is established with confidence. If not, the connection might be refused or a security warning is raised.

Keystore:
A keystore is a secure storage facility for cryptographic keys, including private keys and their corresponding public keys, as well as digital certificates. It is used to manage keys and certificates for various security purposes, such as authentication and encryption. In SSL/TLS communication, the keystore holds the private key of the server and its associated digital certificate. The private key is used for decrypting data encrypted with the corresponding public key, and the digital certificate is used to prove the authenticity of the server. A keystore can also store keys and certificates for other purposes, such as client authentication or code signing.
